public enum Color {
  Black,
  White
  ;
  public Color oposite(){
    return this == Color.Black ? Color.White : Color.Black;
  }
}
