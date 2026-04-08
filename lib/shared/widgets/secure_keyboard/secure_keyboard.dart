import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A secure, on-screen keyboard widget for entering sensitive text.
///
/// Security properties:
/// - Each character group (lowercase, uppercase, digits, symbols) is
///   **scrambled** independently on every session start to defeat UI
///   automation and visual keyloggers.
/// - Never exposes the entered value as a readable String until confirmed.
///   Internally stores characters in a [List<String>] buffer that is zeroed
///   on dispose.
/// - Disables predictive text, autocorrect, and keyboard suggestions.
///
/// UX improvements over the flat layout:
/// - Split into 4 tabs: a-z · A-Z · 0-9 · !@# (symbols)
/// - Each tab shows at most 10 keys per row (comfortable tap targets ≥46 px).
/// - Tab bar stays visible at all times so the user always knows where they are.
///
/// Usage:
/// ```dart
/// SecureKeyboard(
///   onComplete: (value) { /* handle secure input */ },
///   mode: SecureKeyboardMode.password,
/// )
/// ```
class SecureKeyboard extends StatefulWidget {
  const SecureKeyboard({
    super.key,
    required this.onComplete,
    this.onCancel,
    this.mode = SecureKeyboardMode.password,
    this.maxLength = 64,
    this.hintText = 'Ingresa tu contraseña',
    this.confirmLabel = 'Confirmar',
  });

  /// Called when the user taps Confirm with the entered text.
  final ValueChanged<String> onComplete;

  /// Called when the user taps Cancel/X.
  final VoidCallback? onCancel;

  /// [SecureKeyboardMode.password] — input masked with dots.
  /// [SecureKeyboardMode.text]     — input visible.
  final SecureKeyboardMode mode;

  /// Maximum number of characters allowed.
  final int maxLength;

  final String hintText;
  final String confirmLabel;

  @override
  State<SecureKeyboard> createState() => _SecureKeyboardState();
}

// ── Character groups ──────────────────────────────────────────────────────────

const _lowercase = 'abcdefghijklmnopqrstuvwxyz';
const _uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const _digits = '0123456789';
const _symbols = '!@#\$%^&*()-_=+[]{}|;:,.<>?/`~\\\'"';

enum _Tab { lower, upper, digits, symbols }

// ── State ─────────────────────────────────────────────────────────────────────

class _SecureKeyboardState extends State<SecureKeyboard>
    with SingleTickerProviderStateMixin {
  // Internal buffer — never exposes a String directly
  final List<String> _buffer = [];
  bool _showInput = false;
  _Tab _activeTab = _Tab.lower;

  // Scrambled layouts per tab — generated once per session
  late final Map<_Tab, List<String>> _layouts;

  late final AnimationController _feedbackController;
  String? _lastPressedKey;

  @override
  void initState() {
    super.initState();
    _feedbackController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _layouts = _buildLayouts();
  }

  @override
  void dispose() {
    // Zero the buffer on dispose — security hygiene
    for (var i = 0; i < _buffer.length; i++) {
      _buffer[i] = '\x00';
    }
    _buffer.clear();
    _feedbackController.dispose();
    super.dispose();
  }

  /// Shuffles each character group independently.
  Map<_Tab, List<String>> _buildLayouts() {
    List<String> shuffle(String src) {
      final chars = src.split('');
      chars.shuffle(Random.secure());
      return chars;
    }

    return {
      _Tab.lower: shuffle(_lowercase),
      _Tab.upper: shuffle(_uppercase),
      _Tab.digits: shuffle(_digits),
      _Tab.symbols: shuffle(_symbols),
    };
  }

  // ── Input handling ─────────────────────────────────────────────────────────

  void _onKey(String key) {
    if (_buffer.length >= widget.maxLength) return;
    HapticFeedback.lightImpact();
    setState(() {
      _buffer.add(key);
      _lastPressedKey = key;
    });
    _feedbackController.forward(from: 0);
  }

  void _onDelete() {
    if (_buffer.isEmpty) return;
    HapticFeedback.lightImpact();
    setState(() {
      _buffer.last = '\x00';
      _buffer.removeLast();
    });
  }

  void _onConfirm() {
    if (_buffer.isEmpty) return;
    final value = _buffer.join();
    widget.onComplete(value);
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D0D1E),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(),
            _buildInputDisplay(),
            const SizedBox(height: 8),
            _buildTabBar(),
            const SizedBox(height: 4),
            _buildActiveTabKeys(),
            _buildBottomRow(),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  // ── Handle / header ────────────────────────────────────────────────────────

  Widget _buildHandle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
      child: Row(
        children: [
          if (widget.onCancel != null)
            GestureDetector(
              onTap: widget.onCancel,
              child: const Icon(Icons.close, color: Color(0xFF9E9EBF), size: 20),
            )
          else
            const SizedBox(width: 20),
          const Spacer(),
          Text(
            widget.hintText,
            style: const TextStyle(color: Color(0xFF9E9EBF), fontSize: 13),
          ),
          const Spacer(),
          if (widget.mode == SecureKeyboardMode.password)
            GestureDetector(
              onTap: () => setState(() => _showInput = !_showInput),
              child: Icon(
                _showInput
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: const Color(0xFF9E9EBF),
                size: 20,
              ),
            )
          else
            const SizedBox(width: 20),
        ],
      ),
    );
  }

  // ── Input display ──────────────────────────────────────────────────────────

  Widget _buildInputDisplay() {
    final text = _buffer.map((c) {
      if (widget.mode == SecureKeyboardMode.password && !_showInput) {
        return '●';
      }
      return c == '\x00' ? '?' : c;
    }).join();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFF16213E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _buffer.isEmpty
              ? const Color(0xFF2A2A4A)
              : const Color(0xFF6C63FF).withValues(alpha: 0.6),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buffer.isEmpty
                ? Text(
                    widget.hintText,
                    style: const TextStyle(
                      color: Color(0xFF5C5C7A),
                      fontSize: 15,
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          Text(
            '${_buffer.length}/${widget.maxLength}',
            style: const TextStyle(color: Color(0xFF5C5C7A), fontSize: 11),
          ),
        ],
      ),
    );
  }

  // ── Tab bar ────────────────────────────────────────────────────────────────

  static const _tabLabels = {
    _Tab.lower: 'a-z',
    _Tab.upper: 'A-Z',
    _Tab.digits: '0-9',
    _Tab.symbols: '!@#',
  };

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: _Tab.values.map((tab) {
          final isActive = tab == _activeTab;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _activeTab = tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF6C63FF)
                      : const Color(0xFF1E1E38),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isActive
                        ? const Color(0xFF6C63FF)
                        : const Color(0xFF2A2A4A),
                    width: 0.8,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  _tabLabels[tab]!,
                  style: TextStyle(
                    color: isActive ? Colors.white : const Color(0xFF9E9EBF),
                    fontSize: 13,
                    fontWeight:
                        isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── Key grid for active tab ────────────────────────────────────────────────

  Widget _buildActiveTabKeys() {
    final chars = _layouts[_activeTab]!;
    // Chunk into rows of 10 (or fewer for last row)
    const perRow = 10;
    final rows = <List<String>>[];
    for (var i = 0; i < chars.length; i += perRow) {
      rows.add(chars.sublist(i, (i + perRow).clamp(0, chars.length)));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows.map(_buildKeyRow).toList(),
    );
  }

  Widget _buildKeyRow(List<String> chars) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: chars.map(_buildKeyTile).toList(),
      ),
    );
  }

  Widget _buildKeyTile(String char) {
    final isLastPressed = _lastPressedKey == char;
    return Expanded(
      child: AnimatedBuilder(
        animation: _feedbackController,
        builder: (_, child) {
          final scale =
              isLastPressed ? 1.0 - (_feedbackController.value * 0.14) : 1.0;
          return Transform.scale(scale: scale, child: child);
        },
        child: GestureDetector(
          onTap: () => _onKey(char),
          child: Container(
            margin: const EdgeInsets.all(2.5),
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E38),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF2A2A4A),
                width: 0.5,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              char,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Bottom action row ──────────────────────────────────────────────────────

  Widget _buildBottomRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 2),
      child: Row(
        children: [
          // Space bar
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () => _onKey(' '),
              child: Container(
                height: 46,
                margin: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E38),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF2A2A4A),
                    width: 0.5,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Espacio',
                  style: TextStyle(color: Color(0xFF9E9EBF), fontSize: 12),
                ),
              ),
            ),
          ),

          // Delete (long-press clears all)
          Expanded(
            child: GestureDetector(
              onTap: _onDelete,
              onLongPress: () {
                HapticFeedback.heavyImpact();
                setState(() {
                  for (var i = 0; i < _buffer.length; i++) {
                    _buffer[i] = '\x00';
                  }
                  _buffer.clear();
                });
              },
              child: Container(
                height: 46,
                margin: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  color: const Color(0xFF241636),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF3A2A4A),
                    width: 0.5,
                  ),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.backspace_rounded,
                  color: Color(0xFFCF6679),
                  size: 18,
                ),
              ),
            ),
          ),

          // Confirm
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: _buffer.isEmpty ? null : _onConfirm,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 46,
                margin: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  gradient: _buffer.isEmpty
                      ? null
                      : const LinearGradient(
                          colors: [Color(0xFF6C63FF), Color(0xFF5046CC)],
                        ),
                  color: _buffer.isEmpty ? const Color(0xFF1A1A2E) : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.confirmLabel,
                  style: TextStyle(
                    color: _buffer.isEmpty
                        ? const Color(0xFF5C5C7A)
                        : Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum SecureKeyboardMode { password, text }
