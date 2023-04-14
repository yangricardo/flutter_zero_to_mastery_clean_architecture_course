class AdviceUseCases {
  Future<String> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return 'Some fake advice';
  }
}
