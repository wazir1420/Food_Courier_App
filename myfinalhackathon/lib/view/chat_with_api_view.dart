import 'package:finalhackathon/service/socket_service.dart';
import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late SocketService _socketService;

  @override
  void initState() {
    super.initState();
    _socketService = SocketService();
    _setupCommunicationSystem();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _socketService.clearListeners();
    super.dispose();
  }

  void _setupCommunicationSystem() {
    _socketService.clearListeners();

    _socketService.socket.on('message', (data) {
      setState(() {
        _socketService.addMessage('Server: ${data.toString()}');
        _scrollToBottom();
      });
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      if (_socketService.isConnected()) {
        _socketService.socket.emit('messag', _controller.text);
        setState(() {
          _socketService.addMessage('You: ${_controller.text}');
          _controller.text = '';
          _scrollToBottom();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Not connected to the server')),
        );
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD61355),
        title: const Text(
          'Chat Bot',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _socketService.chatHistory.length,
                itemBuilder: (context, index) {
                  final message = _socketService.chatHistory[index];
                  final isServerMessage = message.startsWith('Server:');
                  return Align(
                    alignment: isServerMessage
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isServerMessage
                            ? Colors.blue[100]
                            : Colors.green[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(message),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Send a message, server will send it back',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFFD61355),
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
