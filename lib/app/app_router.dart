import 'package:go_router/go_router.dart';
import 'package:lyqx_test_task/app/app_page_transition.dart';
import 'package:lyqx_test_task/features/login/presentation/pages/bottom_nav.dart';
import 'package:lyqx_test_task/features/login/presentation/pages/login_page.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithAnimation(
        context: context,
        state: state,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: '/home_screen',
      pageBuilder: (context, state) => buildPageWithAnimation(
        context: context,
        state: state,
        child: HomeScreen(),
      ),
    ),
    // GoRoute(
    //   path: '/product_page',
    //   pageBuilder: (context, state) => buildPageWithAnimation(
    //     context: context,
    //     state: state,
    //     child: ProductPage(
    //       item: state.extra as ItemModel,
    //     ),
    //   ),
    // ),
  ],
);



//  GoRoute(
//       path: '/home',
//       pageBuilder: (context, state) => buildPageWithAnimation(
//         context: context,
//         state: state,
//         child: const Home(),
//       ),
//     ),
//     GoRoute(
//       path: '/add_board',
//       pageBuilder: (context, state) => buildPageWithAnimation(
//         context: context,
//         state: state,
//         child: const AddBoard(),
//       ),
//     ),
//     GoRoute(
//       path: '/chat/:title',
//       pageBuilder: (context, state) {
//         final title = state.pathParameters['title']!;
//         return buildPageWithAnimation(
//           context: context,
//           state: state,
//           child: Chat(title: title),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/preview_images',
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>;
//         final imageUrls = args['imageUrls'] as List<String>;
//         final initialIndex = args['initialIndex'] as int;
//         return buildPageWithAnimation(
//           context: context,
//           state: state,
//           child: PreviewImage(
//             imageUrls: imageUrls,
//             initialIndex: initialIndex,
//           ),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/contact_selection',
//       pageBuilder: (context, state) {
//         final contacts = state.extra as List<Contact>;
//         return buildPageWithAnimation(
//           context: context,
//           state: state,
//           child: ContactSelection(contacts: contacts),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/preview_full_image',
//       pageBuilder: (context, state) {
//         final imageUrl = state.extra as String;
//         return buildPageWithAnimation(
//           context: context,
//           state: state,
//           child: PreviewFullImage(imageUrl: imageUrl),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/contact_preview',
//       pageBuilder: (context, state) {
//         final contacts = state.extra as List<Contact>;
//         return buildPageWithAnimation(
//           context: context,
//           state: state,
//           child: ContactPreview(contacts: contacts),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/settings',
//       pageBuilder: (context, state) => buildPageWithAnimation(
//         context: context,
//         state: state,
//         child: const Settings(),
//       ),
//     ),
//     GoRoute(
//       path: '/media',
//       pageBuilder: (context, state) => buildPageWithAnimation(
//         context: context,
//         state: state,
//         child: Media(
//           boardId: state.extra as String,
//         ),
//       ),
//     ),
//     GoRoute(
//       path: '/links',
//       pageBuilder: (context, state) => buildPageWithAnimation(
//         context: context,
//         state: state,
//         child: Link(boardId: state.extra as String),
//       ),
//     ),
//     GoRoute(
//       path: '/link_info/:linkId',
//       pageBuilder: (context, state) {
//         final linkId = state.pathParameters['linkId']!;
//         return buildPageWithAnimation(
//           context: context,
//           state: state,
//           child: LinkInfo(linkId: linkId),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/tasks',
//       pageBuilder: (context, state) {
//         return buildPageWithAnimation(
//             context: context,
//             state: state,
//             child: TaskPage(
//               parentId: state.extra as String,
//             ));
//       },
//     ),
//     GoRoute(
//       path: '/text',
//       pageBuilder: (context, state) => buildPageWithAnimation(
//         context: context,
//         state: state,
//         child: TextView(
//           boardId: state.extra as String,
//         ),
//       ),
//     ),
//     GoRoute(
//       path: '/text_editor',
//       pageBuilder: (context, state) {
//         final params = state.extra as Map<String, dynamic>?;
//         final boardId = params?['boardId'] as String? ?? '';
//         final textId = params?['textId'] as String?;
//         final content = params?['content'] as String?;

//         return buildPageWithAnimation(
//           context: context,
//           state: state,
//           child: TextEditor(
//             boardId: boardId,
//             textId: textId,
//             initialContent: content,
//           ),
//         );
//       },
//     ),