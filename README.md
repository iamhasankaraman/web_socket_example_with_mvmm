# Flutter WebSocket Example with MVVM

This project demonstrates WebSocket implementation in Flutter using MVVM (Model-View-ViewModel) architecture.

## Features

- 🔐 User Authentication
- 💬 Real-time Messaging
- 📊 Connection Analytics
- 👥 Chat Rooms
- 🌓 Light/Dark Theme Support
- 🌍 Multi-language Support

## Getting Started

Test user credentials:

Email: test@test.com
Password: password

## Project Structure

lib/
├── app/ # App configuration
├── core/ # Core features
│ ├── di/ # Dependency injection
│ ├── router/ # Routing management
│ └── enums/ # Enum definitions
├── data/
│ ├── models/ # Data models
│ └── repositories/ # Repository implementations
└── features/ # App features
├── analytics/ # Analytics feature
├── auth/ # Authentication
├── chat/ # Chat features
├── home/ # Home page
├── profile/ # Profile page
└── settings/ # Settings


## Technical Details

### WebSocket Implementation

WebSocket connection is managed in `WebSocketRepositoryImpl` class:

class WebSocketRepositoryImpl {
final channel = WebSocketChannel.connect(
Uri.parse('wss://echo.websocket.org'),
);
Stream<WebSocketMessage> get messages => channel.stream
.map((event) => WebSocketMessage.fromJson(event));
Future<void> sendMessage(WebSocketMessage message) async {
channel.sink.add(jsonEncode(message.toJson()));
}
}


### Architecture

- **MVVM**: Clean architecture with View-ViewModel-Model layers
- **Provider**: State management using Provider pattern
- **Auto Route**: Type-safe routing
- **GetIt**: Dependency injection
- **Easy Localization**: Multi-language support

### Technologies Used

- **Flutter**: UI framework
- **Provider**: State management
- **GetIt**: Dependency injection
- **Auto Route**: Navigation
- **Easy Localization**: Multi-language support
- **web_socket_channel**: WebSocket connections

### Installation

1. Clone the project
2. Install dependencies
3. Run the app


### Key Features

1. **Real-time Communication**
   - Instant messaging
   - Connection status monitoring
   - Automatic reconnection

2. **Chat Rooms**
   - Create public/private rooms
   - Join existing rooms
   - Real-time participant updates

3. **Analytics**
   - Connection statistics
   - Message metrics
   - Performance monitoring

4. **Authentication**
   - User login/logout
   - Session management
   - Secure WebSocket connections

5. **UI/UX**
   - Material Design 3
   - Dark/Light theme
   - Responsive layout
   - Multi-language support

### Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Best Practices

- Clean Architecture principles
- SOLID design patterns
- Comprehensive error handling
- Efficient state management
- Code documentation
- Unit and widget testing

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Contributors and the open-source community

## This README:
- Clearly explains the project purpose and features
- Provides detailed technical information and architecture
- Includes installation steps
- Contains contribution guidelines
- Details WebSocket implementation
- Offers comprehensive documentation for developers
# web_socket_example_with_mvmm
