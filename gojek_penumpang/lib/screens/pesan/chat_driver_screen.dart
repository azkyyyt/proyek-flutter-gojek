import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';

class ChatDriverScreen extends StatefulWidget {
  final String driverName;
  const ChatDriverScreen({super.key, this.driverName = 'Budi Santoso'});

  @override
  State<ChatDriverScreen> createState() => _ChatDriverScreenState();
}

class _ChatDriverScreenState extends State<ChatDriverScreen> {
  final List<Map<String, dynamic>> _messages = [
    {
      'sender': 'driver',
      'text': 'Halo kak, saya sudah ambil orderan Anda dan sedang meluncur ke titik jemput ya.',
      'time': '14:25',
    },
    {
      'sender': 'user',
      'text': 'Oke pak, saya tunggu di lobi utama depan lobi barat ya.',
      'time': '14:26',
    },
    {
      'sender': 'driver',
      'text': 'Siap kak, saya pakai motor Vario hitam helm hijau MajuRide.',
      'time': '14:27',
    },
  ];

  final _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage([String? quickText]) {
    final text = quickText ?? _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'sender': 'user',
        'text': text,
        'time': '14:29',
      });
      if (quickText == null) {
        _textController.clear();
      }
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MajuRideTheme.bgGrey,
      appBar: AppBar(
        backgroundColor: MajuRideTheme.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MajuRideTheme.textDark),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/beranda');
            }
          },
        ),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: MajuRideTheme.cardBorder),
              ),
              child: Image.asset(
                'assets/images/avatar_driver.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 22),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.driverName,
                  style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold, color: MajuRideTheme.textDark),
                ),
                const Row(
                  children: [
                    CircleAvatar(radius: 3.5, backgroundColor: MajuRideTheme.primaryGreen),
                    SizedBox(width: 4),
                    Text('Online • Mitra MajuRide', style: TextStyle(fontSize: 11, color: MajuRideTheme.textGrey)),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: MajuRideTheme.primaryGreen),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Menghubungi ${widget.driverName}...'),
                  backgroundColor: MajuRideTheme.primaryGreen,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Messages List
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final bool isUser = msg['sender'] == 'user';
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                      decoration: BoxDecoration(
                        color: isUser ? MajuRideTheme.primaryGreen : MajuRideTheme.surfaceWhite,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isUser ? MajuRideTheme.primaryGreen : MajuRideTheme.cardBorder,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            msg['text'] as String,
                            style: TextStyle(
                              color: isUser ? Colors.white : MajuRideTheme.textDark,
                              fontSize: 13.5,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg['time'] as String,
                            style: TextStyle(
                              color: isUser ? Colors.white70 : MajuRideTheme.textLight,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Quick Suggestions
            SizedBox(
              height: 38,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildQuickReply('Saya sudah di titik jemput'),
                  _buildQuickReply('Tolong tunggu sebentar ya'),
                  _buildQuickReply('Saya pakai baju hitam'),
                  _buildQuickReply('Bawa helm cadangan ya'),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Bottom Text Input Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: MajuRideTheme.surfaceWhite,
                border: Border(top: BorderSide(color: MajuRideTheme.cardBorder)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Tulis pesan untuk driver...',
                        hintStyle: const TextStyle(color: MajuRideTheme.textLight, fontSize: 13.5),
                        filled: true,
                        fillColor: MajuRideTheme.bgGrey,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: MajuRideTheme.primaryGreen,
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
                      onPressed: () => _sendMessage(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickReply(String text) {
    return GestureDetector(
      onTap: () => _sendMessage(text),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: MajuRideTheme.surfaceWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: MajuRideTheme.cardBorder),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, color: MajuRideTheme.textDark, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
