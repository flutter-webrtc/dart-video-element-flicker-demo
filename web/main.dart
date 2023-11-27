import 'dart:html' as html;

html.MediaStream? _localStream;

void main() async {
  html.document.querySelector('#addVideo')?.onClick.listen((event) async {
    print('add video');
    if (_localStream == null) {
      _localStream = await html.window.navigator.mediaDevices
          ?.getUserMedia({'video': true});
    }
    var local = html.document.querySelector('#local_videos');
    var localVideo = html.VideoElement();
    localVideo.style.width = '240px';
    localVideo.style.height = '180px';
    localVideo.style.border = '1px solid black';
    localVideo.muted = true;
    localVideo.autoplay = true;
    local!.append(localVideo);
    localVideo.srcObject = _localStream;
  });

  html.document.querySelector('#removeVideo')?.onClick.listen((event) async {
    print('remove video');
    var local = html.document.querySelector('#local_videos');
    local!.children.last.remove();
  });
}
