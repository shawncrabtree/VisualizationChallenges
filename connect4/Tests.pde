class Tests {

  public boolean run() {
    println("RUNNING TESTS");
    return new RowWinnerTests().run()
      && new ColWinnerTests().run()
      ;
  }
}