class Word{
  int id,difficulty;
  String word,definition1,definition2,example,translation;

  Word({this.id,this.word,this.definition1,this.definition2,this.difficulty,this.example,this.translation});

  factory Word.fromJson(Map<String, dynamic> json) {
    return new Word(
      id: json['id'],
      word: json['word'],
      definition1: json['defn1'],
      definition2: json['defn2'],
      example: json['example'],
      difficulty: json['difficulty'],
      translation: json['translation'],
    );
  }
}