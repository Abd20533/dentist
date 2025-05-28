import 'package:dentist/core/constant/image_asset.dart';
import 'package:dentist/data/modules/on_boarding_modules.dart';

List<OnBoardingModel> onBoardingModel = [
  OnBoardingModel(
      title: "Your Data, \nProtected & Organized",
      body: "Military-grade encryption keeps records safe while our timeline view helps track oral health progress over time",

      image: AppImageAsset
      .onboarding),
  OnBoardingModel(
      title: "Personalized\n Treatment Guidance",
      body: "Beyond detection: Receive evidence-based care recommendations and seamlessly share reports with your dentist",
      image: AppImageAsset.onboarding1),
  OnBoardingModel(
      title: "Precision Diagnosis in \nSeconds!",
      body: "Scan dental X-rays with cutting-edge Al and get accurate, real-time insights for cories, periapical lesions, and more.",

      image: AppImageAsset.onboarding2),

];
