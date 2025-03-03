class LogicController {
  bool _initOnce = false;
  bool get initOnce {
    if (_initOnce) {
      return true;
    }
    _initOnce = true;
    return false;
  }

  bool _disposeOnce = false;
  bool get disposeOnce {
    if (_disposeOnce) {
      return true;
    }
    _disposeOnce = true;
    return false;
  }
}

class ScreenController extends LogicController {
  @override
  // ignore: unnecessary_overrides
  bool get initOnce {
    return super.initOnce;
  }

  @override
  // ignore: unnecessary_overrides
  bool get disposeOnce {
    return super.disposeOnce;
  }
}
