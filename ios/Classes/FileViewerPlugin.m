#import "FileViewerPlugin.h"
#if __has_include(<file_viewer/file_viewer-Swift.h>)
#import <file_viewer/file_viewer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "file_viewer-Swift.h"
#endif

@implementation FileViewerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFileViewerPlugin registerWithRegistrar:registrar];
}
@end
