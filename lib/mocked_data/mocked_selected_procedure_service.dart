mixin MockedSelectedProcedureService {
  static const String title = 'Lorem Ipsum';
  static const String descriptionContent =
      'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  static const String decisionTitle = 'Beschlusstext';
  static const String decisionContent =
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics';

  static List<List<String>> getCategoryContent() {
    return [
      [
        'Von',
        'Vorgang',
        'erstellt am',
        'Abstimmung',
      ],
      [
        'David Müller',
        '233241',
        '10.12.2021',
        '13.02.2022',
      ],
    ];
  }
}
