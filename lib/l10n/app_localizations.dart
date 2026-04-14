import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @welcomeText.
  ///
  /// In en, this message translates to:
  /// **'Get your workout & meal plan in seconds 💪🔥'**
  String get welcomeText;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @sets.
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get sets;

  /// No description provided for @reps.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get reps;

  /// No description provided for @preparingProgram.
  ///
  /// In en, this message translates to:
  /// **'Preparing your program…'**
  String get preparingProgram;

  /// No description provided for @fillDetails.
  ///
  /// In en, this message translates to:
  /// **'Fill in Your Details'**
  String get fillDetails;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weight;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get height;

  /// No description provided for @enterWeight.
  ///
  /// In en, this message translates to:
  /// **'Enter your weight'**
  String get enterWeight;

  /// No description provided for @enterHeight.
  ///
  /// In en, this message translates to:
  /// **'Enter your height'**
  String get enterHeight;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get invalidNumber;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @planType.
  ///
  /// In en, this message translates to:
  /// **'Plan Type'**
  String get planType;

  /// No description provided for @generateProgram.
  ///
  /// In en, this message translates to:
  /// **'Generate Program'**
  String get generateProgram;

  /// No description provided for @workoutProgram.
  ///
  /// In en, this message translates to:
  /// **'Workout Program 💪'**
  String get workoutProgram;

  /// No description provided for @noWorkoutProgram.
  ///
  /// In en, this message translates to:
  /// **'No workout program available'**
  String get noWorkoutProgram;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @watchVideo.
  ///
  /// In en, this message translates to:
  /// **'Watch Video'**
  String get watchVideo;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @mealPlan.
  ///
  /// In en, this message translates to:
  /// **'Meal Plan'**
  String get mealPlan;

  /// No description provided for @cheatMeal.
  ///
  /// In en, this message translates to:
  /// **'Cheat Meal 🍕'**
  String get cheatMeal;

  /// No description provided for @dinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get dinner;

  /// No description provided for @bulking.
  ///
  /// In en, this message translates to:
  /// **'Bulking'**
  String get bulking;

  /// No description provided for @cutting.
  ///
  /// In en, this message translates to:
  /// **'Cutting'**
  String get cutting;

  /// No description provided for @fitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get fitness;

  /// No description provided for @workout.
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get workout;

  /// No description provided for @day1.
  ///
  /// In en, this message translates to:
  /// **'Day 1'**
  String get day1;

  /// No description provided for @day2.
  ///
  /// In en, this message translates to:
  /// **'Day 2'**
  String get day2;

  /// No description provided for @day3.
  ///
  /// In en, this message translates to:
  /// **'Day 3'**
  String get day3;

  /// No description provided for @day4.
  ///
  /// In en, this message translates to:
  /// **'Day 4'**
  String get day4;

  /// No description provided for @day5.
  ///
  /// In en, this message translates to:
  /// **'Day 5'**
  String get day5;

  /// No description provided for @hipThrust.
  ///
  /// In en, this message translates to:
  /// **'Hip Thrust'**
  String get hipThrust;

  /// No description provided for @hipThrustDesc.
  ///
  /// In en, this message translates to:
  /// **'An effective exercise to activate and strengthen the glutes, helping improve strength, build muscle, and reduce the risk of injury.'**
  String get hipThrustDesc;

  /// No description provided for @gluteBridge.
  ///
  /// In en, this message translates to:
  /// **'Glute Bridge'**
  String get gluteBridge;

  /// No description provided for @gluteBridgeDesc.
  ///
  /// In en, this message translates to:
  /// **'An effective exercise to strengthen the glutes and hamstrings, improving stability, enhancing strength, and reducing the risk of injury.'**
  String get gluteBridgeDesc;

  /// No description provided for @cableKickbacks.
  ///
  /// In en, this message translates to:
  /// **'Cable Kickbacks'**
  String get cableKickbacks;

  /// No description provided for @cableKickbacksDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise that targets the glutes, helping improve shape, tone, and muscle definition.'**
  String get cableKickbacksDesc;

  /// No description provided for @bulgarianSplitSquat.
  ///
  /// In en, this message translates to:
  /// **'Bulgarian Split Squat'**
  String get bulgarianSplitSquat;

  /// No description provided for @bulgarianSplitSquatDesc.
  ///
  /// In en, this message translates to:
  /// **'A single-leg strength and balance exercise that builds leg strength, stability, and muscle symmetry.'**
  String get bulgarianSplitSquatDesc;

  /// No description provided for @stepUps.
  ///
  /// In en, this message translates to:
  /// **'Step Ups'**
  String get stepUps;

  /// No description provided for @stepUpsDesc.
  ///
  /// In en, this message translates to:
  /// **'A functional lower body exercise that improves strength, balance, and overall movement performance.'**
  String get stepUpsDesc;

  /// No description provided for @abductionMachine.
  ///
  /// In en, this message translates to:
  /// **'Abduction Machine'**
  String get abductionMachine;

  /// No description provided for @abductionMachineDesc.
  ///
  /// In en, this message translates to:
  /// **'Targets the outer glutes and hips, helping improve shape, stability, and lower body strength.'**
  String get abductionMachineDesc;

  /// No description provided for @latPulldown.
  ///
  /// In en, this message translates to:
  /// **'Lat Pulldown'**
  String get latPulldown;

  /// No description provided for @latPulldownDesc.
  ///
  /// In en, this message translates to:
  /// **'A back exercise that builds width and strength, improving upper body shape and overall pulling power.'**
  String get latPulldownDesc;

  /// No description provided for @dumbbellRow.
  ///
  /// In en, this message translates to:
  /// **'Dumbbell Row'**
  String get dumbbellRow;

  /// No description provided for @dumbbellRowDesc.
  ///
  /// In en, this message translates to:
  /// **'Builds mid-back thickness and strength, improving posture and overall back development.'**
  String get dumbbellRowDesc;

  /// No description provided for @shoulderPress.
  ///
  /// In en, this message translates to:
  /// **'Shoulder Press'**
  String get shoulderPress;

  /// No description provided for @shoulderPressDesc.
  ///
  /// In en, this message translates to:
  /// **'An overhead pressing exercise that builds shoulder strength, size, and overall upper body development.'**
  String get shoulderPressDesc;

  /// No description provided for @lateralRaise.
  ///
  /// In en, this message translates to:
  /// **'Lateral Raise'**
  String get lateralRaise;

  /// No description provided for @lateralRaiseDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise targeting the side delts, helping improve shoulder width and upper body aesthetics.'**
  String get lateralRaiseDesc;

  /// No description provided for @tricepPushdown.
  ///
  /// In en, this message translates to:
  /// **'Tricep Pushdown'**
  String get tricepPushdown;

  /// No description provided for @tricepPushdownDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise targeting the triceps, helping build arm strength and definition.'**
  String get tricepPushdownDesc;

  /// No description provided for @bicepCurl.
  ///
  /// In en, this message translates to:
  /// **'Bicep Curl'**
  String get bicepCurl;

  /// No description provided for @bicepCurlDesc.
  ///
  /// In en, this message translates to:
  /// **'An arm exercise that targets the biceps, helping increase muscle size, strength, and definition.'**
  String get bicepCurlDesc;

  /// No description provided for @squats.
  ///
  /// In en, this message translates to:
  /// **'Squats'**
  String get squats;

  /// No description provided for @squatsDesc.
  ///
  /// In en, this message translates to:
  /// **'A compound lower body exercise that builds strength, muscle mass, and overall athletic performance.'**
  String get squatsDesc;

  /// No description provided for @legPress.
  ///
  /// In en, this message translates to:
  /// **'Leg Press'**
  String get legPress;

  /// No description provided for @legPressDesc.
  ///
  /// In en, this message translates to:
  /// **'A machine-based lower body exercise that builds leg strength and muscle mass in a controlled way.'**
  String get legPressDesc;

  /// No description provided for @romanianDeadlift.
  ///
  /// In en, this message translates to:
  /// **'Romanian Deadlift'**
  String get romanianDeadlift;

  /// No description provided for @romanianDeadliftDesc.
  ///
  /// In en, this message translates to:
  /// **'A powerful exercise targeting the hamstrings and glutes, improving strength and muscle balance.'**
  String get romanianDeadliftDesc;

  /// No description provided for @legCurl.
  ///
  /// In en, this message translates to:
  /// **'Leg Curl'**
  String get legCurl;

  /// No description provided for @legCurlDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise that targets the hamstrings, improving strength and muscle performance.'**
  String get legCurlDesc;

  /// No description provided for @legExtension.
  ///
  /// In en, this message translates to:
  /// **'Leg Extension'**
  String get legExtension;

  /// No description provided for @legExtensionDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise targeting the quadriceps, helping build strength and muscle definition.'**
  String get legExtensionDesc;

  /// No description provided for @calfRaises.
  ///
  /// In en, this message translates to:
  /// **'Calf Raises'**
  String get calfRaises;

  /// No description provided for @calfRaisesDesc.
  ///
  /// In en, this message translates to:
  /// **'Strengthens the calf muscles, improving lower leg strength and stability.'**
  String get calfRaisesDesc;

  /// No description provided for @plank.
  ///
  /// In en, this message translates to:
  /// **'Plank'**
  String get plank;

  /// No description provided for @plankDesc.
  ///
  /// In en, this message translates to:
  /// **'A core exercise that builds stability, improves balance, and increases muscular endurance.'**
  String get plankDesc;

  /// No description provided for @russianTwists.
  ///
  /// In en, this message translates to:
  /// **'Russian Twists'**
  String get russianTwists;

  /// No description provided for @russianTwistsDesc.
  ///
  /// In en, this message translates to:
  /// **'A core rotation exercise that strengthens the abdominal muscles and improves control and stability.'**
  String get russianTwistsDesc;

  /// No description provided for @mountainClimbers.
  ///
  /// In en, this message translates to:
  /// **'Mountain Climbers'**
  String get mountainClimbers;

  /// No description provided for @mountainClimbersDesc.
  ///
  /// In en, this message translates to:
  /// **'A dynamic full-body exercise that combines cardio and core training to improve endurance and burn calories.'**
  String get mountainClimbersDesc;

  /// No description provided for @jumpRope.
  ///
  /// In en, this message translates to:
  /// **'Jump Rope'**
  String get jumpRope;

  /// No description provided for @jumpRopeDesc.
  ///
  /// In en, this message translates to:
  /// **'A high-intensity cardio exercise that boosts endurance, coordination, and calorie burning.'**
  String get jumpRopeDesc;

  /// No description provided for @treadmill.
  ///
  /// In en, this message translates to:
  /// **'Treadmill'**
  String get treadmill;

  /// No description provided for @treadmillDesc.
  ///
  /// In en, this message translates to:
  /// **'An effective cardio workout for fat loss, improving heart health and overall fitness.'**
  String get treadmillDesc;

  /// No description provided for @walking.
  ///
  /// In en, this message translates to:
  /// **'Walking'**
  String get walking;

  /// No description provided for @walkingDesc.
  ///
  /// In en, this message translates to:
  /// **'A light recovery activity that improves blood circulation and supports active recovery.'**
  String get walkingDesc;

  /// No description provided for @stretching.
  ///
  /// In en, this message translates to:
  /// **'Stretching'**
  String get stretching;

  /// No description provided for @stretchingDesc.
  ///
  /// In en, this message translates to:
  /// **'Exercises that improve flexibility, reduce muscle tension, and support recovery.'**
  String get stretchingDesc;

  /// No description provided for @yoga.
  ///
  /// In en, this message translates to:
  /// **'Yoga'**
  String get yoga;

  /// No description provided for @yogaDesc.
  ///
  /// In en, this message translates to:
  /// **'A practice combining flexibility, breathing, and relaxation to improve both physical and mental well-being.'**
  String get yogaDesc;

  /// No description provided for @benchPress.
  ///
  /// In en, this message translates to:
  /// **'Bench Press'**
  String get benchPress;

  /// No description provided for @benchPressDesc.
  ///
  /// In en, this message translates to:
  /// **'A fundamental upper body exercise that builds chest strength, muscle mass, and pushing power.'**
  String get benchPressDesc;

  /// No description provided for @inclineDumbbellPress.
  ///
  /// In en, this message translates to:
  /// **'Incline Dumbbell Press'**
  String get inclineDumbbellPress;

  /// No description provided for @inclineDumbbellPressDesc.
  ///
  /// In en, this message translates to:
  /// **'An upper chest exercise that helps build strength, size, and muscle balance.'**
  String get inclineDumbbellPressDesc;

  /// No description provided for @chestFly.
  ///
  /// In en, this message translates to:
  /// **'Chest Fly'**
  String get chestFly;

  /// No description provided for @chestFlyDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise that targets the chest muscles for better definition and shape.'**
  String get chestFlyDesc;

  /// No description provided for @cableCrossover.
  ///
  /// In en, this message translates to:
  /// **'Cable Crossover'**
  String get cableCrossover;

  /// No description provided for @cableCrossoverDesc.
  ///
  /// In en, this message translates to:
  /// **'A chest exercise focused on muscle contraction and shaping for better definition.'**
  String get cableCrossoverDesc;

  /// No description provided for @pushUps.
  ///
  /// In en, this message translates to:
  /// **'Push Ups'**
  String get pushUps;

  /// No description provided for @pushUpsDesc.
  ///
  /// In en, this message translates to:
  /// **'A bodyweight exercise that strengthens the chest, triceps, and shoulders.'**
  String get pushUpsDesc;

  /// No description provided for @dips.
  ///
  /// In en, this message translates to:
  /// **'Dips'**
  String get dips;

  /// No description provided for @dipsDesc.
  ///
  /// In en, this message translates to:
  /// **'A powerful upper body exercise that builds pushing strength in chest and triceps.'**
  String get dipsDesc;

  /// No description provided for @pullUps.
  ///
  /// In en, this message translates to:
  /// **'Pull Ups'**
  String get pullUps;

  /// No description provided for @pullUpsDesc.
  ///
  /// In en, this message translates to:
  /// **'A powerful upper body exercise that builds back and lat strength.'**
  String get pullUpsDesc;

  /// No description provided for @barbellRow.
  ///
  /// In en, this message translates to:
  /// **'Barbell Row'**
  String get barbellRow;

  /// No description provided for @barbellRowDesc.
  ///
  /// In en, this message translates to:
  /// **'A compound movement that builds back thickness and overall strength.'**
  String get barbellRowDesc;

  /// No description provided for @seatedRow.
  ///
  /// In en, this message translates to:
  /// **'Seated Row'**
  String get seatedRow;

  /// No description provided for @seatedRowDesc.
  ///
  /// In en, this message translates to:
  /// **'An exercise that improves mid-back strength and posture.'**
  String get seatedRowDesc;

  /// No description provided for @facePull.
  ///
  /// In en, this message translates to:
  /// **'Face Pull'**
  String get facePull;

  /// No description provided for @facePullDesc.
  ///
  /// In en, this message translates to:
  /// **'An exercise for rear delts and shoulder health and stability.'**
  String get facePullDesc;

  /// No description provided for @deadlift.
  ///
  /// In en, this message translates to:
  /// **'Deadlift'**
  String get deadlift;

  /// No description provided for @deadliftDesc.
  ///
  /// In en, this message translates to:
  /// **'A full-body strength movement that builds power and muscle mass.'**
  String get deadliftDesc;

  /// No description provided for @lunges.
  ///
  /// In en, this message translates to:
  /// **'Lunges'**
  String get lunges;

  /// No description provided for @lungesDesc.
  ///
  /// In en, this message translates to:
  /// **'A lower body exercise that builds leg strength, balance, and coordination.'**
  String get lungesDesc;

  /// No description provided for @frontRaise.
  ///
  /// In en, this message translates to:
  /// **'Front Raise'**
  String get frontRaise;

  /// No description provided for @frontRaiseDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise that targets the front shoulder muscles.'**
  String get frontRaiseDesc;

  /// No description provided for @reverseFly.
  ///
  /// In en, this message translates to:
  /// **'Reverse Fly'**
  String get reverseFly;

  /// No description provided for @reverseFlyDesc.
  ///
  /// In en, this message translates to:
  /// **'An exercise that develops the rear delts and improves shoulder posture.'**
  String get reverseFlyDesc;

  /// No description provided for @shrugs.
  ///
  /// In en, this message translates to:
  /// **'Shrugs'**
  String get shrugs;

  /// No description provided for @shrugsDesc.
  ///
  /// In en, this message translates to:
  /// **'An exercise that strengthens and builds the trapezius muscles.'**
  String get shrugsDesc;

  /// No description provided for @barbellCurl.
  ///
  /// In en, this message translates to:
  /// **'Barbell Curl'**
  String get barbellCurl;

  /// No description provided for @barbellCurlDesc.
  ///
  /// In en, this message translates to:
  /// **'A strength exercise that builds biceps size and power.'**
  String get barbellCurlDesc;

  /// No description provided for @hammerCurl.
  ///
  /// In en, this message translates to:
  /// **'Hammer Curl'**
  String get hammerCurl;

  /// No description provided for @hammerCurlDesc.
  ///
  /// In en, this message translates to:
  /// **'An exercise that develops biceps and forearm strength.'**
  String get hammerCurlDesc;

  /// No description provided for @skullCrushers.
  ///
  /// In en, this message translates to:
  /// **'Skull Crushers'**
  String get skullCrushers;

  /// No description provided for @skullCrushersDesc.
  ///
  /// In en, this message translates to:
  /// **'An isolation exercise that targets and strengthens the triceps.'**
  String get skullCrushersDesc;

  /// No description provided for @fullBodyCircuit.
  ///
  /// In en, this message translates to:
  /// **'Full Body Circuit'**
  String get fullBodyCircuit;

  /// No description provided for @fullBodyCircuitDesc.
  ///
  /// In en, this message translates to:
  /// **'A high-intensity workout designed to burn fat and train the entire body.'**
  String get fullBodyCircuitDesc;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @breakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get breakfast;

  /// No description provided for @lunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get lunch;

  /// No description provided for @snack.
  ///
  /// In en, this message translates to:
  /// **'Snack'**
  String get snack;

  /// No description provided for @chickenRice.
  ///
  /// In en, this message translates to:
  /// **'Chicken & Rice'**
  String get chickenRice;

  /// No description provided for @oatmealBananaPb.
  ///
  /// In en, this message translates to:
  /// **'Oatmeal Banana Peanut Butter'**
  String get oatmealBananaPb;

  /// No description provided for @salmonSweetPotato.
  ///
  /// In en, this message translates to:
  /// **'Salmon & Sweet Potato'**
  String get salmonSweetPotato;

  /// No description provided for @eggsToast.
  ///
  /// In en, this message translates to:
  /// **'Eggs & Toast'**
  String get eggsToast;

  /// No description provided for @beefQuinoa.
  ///
  /// In en, this message translates to:
  /// **'Beef & Quinoa'**
  String get beefQuinoa;

  /// No description provided for @proteinShake.
  ///
  /// In en, this message translates to:
  /// **'Protein Shake'**
  String get proteinShake;

  /// No description provided for @tunaSweetPotato.
  ///
  /// In en, this message translates to:
  /// **'Tuna & Sweet Potato'**
  String get tunaSweetPotato;

  /// No description provided for @greekYogurtNuts.
  ///
  /// In en, this message translates to:
  /// **'Greek Yogurt & Nuts'**
  String get greekYogurtNuts;

  /// No description provided for @turkeyQuinoa.
  ///
  /// In en, this message translates to:
  /// **'Turkey & Quinoa'**
  String get turkeyQuinoa;

  /// No description provided for @grilledChickenSalad.
  ///
  /// In en, this message translates to:
  /// **'Grilled Chicken Salad'**
  String get grilledChickenSalad;

  /// No description provided for @tunaSalad.
  ///
  /// In en, this message translates to:
  /// **'Tuna Salad'**
  String get tunaSalad;

  /// No description provided for @yogurtBanana.
  ///
  /// In en, this message translates to:
  /// **'Yogurt & Banana'**
  String get yogurtBanana;

  /// No description provided for @pancakesBerries.
  ///
  /// In en, this message translates to:
  /// **'Pancakes & Berries'**
  String get pancakesBerries;

  /// No description provided for @burgerFries.
  ///
  /// In en, this message translates to:
  /// **'Burger & Fries'**
  String get burgerFries;

  /// No description provided for @iceCream.
  ///
  /// In en, this message translates to:
  /// **'Ice Cream'**
  String get iceCream;

  /// No description provided for @pizzaSalad.
  ///
  /// In en, this message translates to:
  /// **'Pizza & Salad'**
  String get pizzaSalad;

  /// No description provided for @almonds.
  ///
  /// In en, this message translates to:
  /// **'Almonds'**
  String get almonds;

  /// No description provided for @oatsMilkFruits.
  ///
  /// In en, this message translates to:
  /// **'Oats with milk and fruits'**
  String get oatsMilkFruits;

  /// No description provided for @calorieTracker.
  ///
  /// In en, this message translates to:
  /// **'Calorie Tracker'**
  String get calorieTracker;

  /// No description provided for @addMeal.
  ///
  /// In en, this message translates to:
  /// **'Add Meal'**
  String get addMeal;

  /// No description provided for @meal.
  ///
  /// In en, this message translates to:
  /// **'Meal'**
  String get meal;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @onTrack.
  ///
  /// In en, this message translates to:
  /// **'On Track'**
  String get onTrack;

  /// No description provided for @exceeded.
  ///
  /// In en, this message translates to:
  /// **'Exceeded'**
  String get exceeded;

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get kcal;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
