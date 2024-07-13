enum StaticPagesTypesEnum {
  about(pathEndpoint: 'about'),
  terms(pathEndpoint: 'terms'),
  contact(pathEndpoint: 'contact'),
  rights(pathEndpoint: 'rights'),
  howToUse(pathEndpoint: 'how_to_use'),
  howWeHelp(pathEndpoint: 'how_we_help'),
  commissionAndFees(pathEndpoint: 'commission_and_fees');
  const StaticPagesTypesEnum({required this.pathEndpoint});
  final String pathEndpoint;
}
