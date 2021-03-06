part of petisland.rescue_voting.screen;

class RescueVotingScreen extends TStatelessWidget {
  static const name = '/RescueVotingScreen';
  final Rescue rescue;

  RescueVotingScreen({Key key, @required this.rescue}) : super(key: key);

  Account get account => rescue.account;
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: PostDetailAppBar(
          isOwner: AccountUtils.isOwner(account),
          onTapBack: () => _onTapBack(context),
          onSelected: (_) => _onTapSeeMore(context, _),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        controller: controller,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          RescueDetailSummaryWidget(
            rescue: rescue,
            hideDescription: true,
            hideImageSlider: true,
            hideLocation: true,
          ),
          const SizedBox(height: 5),
          Text(
            'Vote for the best of the rescue',
            style: TTextStyles.bold(
              fontSize: 16,
              color: TColors.dark_pink,
            ),
          ),
          const SizedBox(height: 5),
          HeroVotingListingWidget(rescueId: rescue.id),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  void _onTapBack(BuildContext context) {
    closeScreen(context, RescueVotingScreen.name);
  }

  void _onTapSeeMore(BuildContext context, OptionType seeMoreType) {
    switch (seeMoreType) {
      case OptionType.Report:
        _reportPost(context);
        break;
      case OptionType.Delete:
        break;
      case OptionType.Edit:
        break;
      default:
    }
  }

  void _reportPost(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (_) => KikiReportWidget(
        onSendReport: _sendReport,
      ),
    );
  }

  void _sendReport(ReportData value) {
    // TODO: send report rescue
  }
}
