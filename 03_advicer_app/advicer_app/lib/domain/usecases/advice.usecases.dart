class AdviceUseCases {
  Future getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
  }
}
