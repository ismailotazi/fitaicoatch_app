class ProgramGenerator {
  Map<String, List<Map<String, String>>> generateProgram({
    required String goal,
    required double weight,
    required double height,
    required String gender,
  }) {
    /// 🔴 FEMALE PRO
    if (gender == 'Female') {
      return {
        'Day 1': [
          {
            'exercise': 'Hip Thrust',
            'sets': '4',
            'reps': '12',
            'description':
                'Elevate glutes and hamstrings with focused Hip Thrusts, enhancing strength, tone, and lower-body power.',
            'video': 'https://www.youtube.com/watch?v=example1',
            'imageStart': 'images/hip_thrust_begin.jpg',
            'imageEnd': 'images/hip_thrust_end.jpg',
          },
          {
            'exercise': 'Glute Bridge',
            'sets': '3',
            'reps': '15',
            'description':
                'Activate your glutes and stabilize your core with controlled Glute Bridges for a sculpted lower body.',
            'video': 'https://www.youtube.com/watch?v=example2',
            'imageStart': 'images/glute_bridge_begin.jpg',
            'imageEnd': 'images/glute_bridge_end.jpg',
          },
          {
            'exercise': 'Cable Kickbacks',
            'sets': '3',
            'reps': '12 each',
            'description':
                'Isolate and shape your glutes for better muscle definition and strength.',
            'video': 'https://www.youtube.com/watch?v=example3',
            'imageStart': 'images/cable_kickbacks_begin.jpg',
            'imageEnd': 'images/cable_kickbacks_end.jpg',
          },
          {
            'exercise': 'Bulgarian Split Squat',
            'sets': '3',
            'reps': '12 each',
            'description':
                'Build strong quads and glutes while improving balance and unilateral leg strength.',
            'video': 'https://www.youtube.com/watch?v=example4',
            'imageStart': 'images/bulgarian_split_begin.jpg',
            'imageEnd': 'images/bulgarian_split_end.jpg',
          },
          {
            'exercise': 'Step Ups',
            'sets': '3',
            'reps': '12 each',
            'description':
                'Strengthen legs and glutes while enhancing stability and coordination.',
            'video': 'https://www.youtube.com/watch?v=example5',
            'imageStart': 'images/step_ups_begin.jpg',
            'imageEnd': 'images/step_ups_end.jpg',
          },
          {
            'exercise': 'Abduction Machine',
            'sets': '3',
            'reps': '15',
            'description':
                'Target outer thighs and glutes for enhanced shaping and toning.',
            'video': 'https://www.youtube.com/watch?v=example6',
            'imageStart': 'images/abduction_machine_begin.jpg',
            'imageEnd': 'images/abduction_machine_end.jpg',
          },
        ],
        'Day 2': [
          {
            'exercise': 'Lat Pulldown',
            'sets': '4',
            'reps': '10-12',
            'description':
                'Develop back width and lats strength for improved posture and upper-body power.',
            'video': 'https://www.youtube.com/watch?v=example7',
            'imageStart': 'images/lat_pulldown_begin.jpg',
            'imageEnd': 'images/lat_pulldown_end.jpg',
          },
          {
            'exercise': 'Dumbbell Row',
            'sets': '4',
            'reps': '10-12',
            'description':
                'Strengthen your mid-back and sculpt a strong, defined upper body.',
            'video': 'https://www.youtube.com/watch?v=example8',
            'imageStart': 'images/dumbbell_row_begin.jpg',
            'imageEnd': 'images/dumbbell_row_end.jpg',
          },
          {
            'exercise': 'Shoulder Press',
            'sets': '3',
            'reps': '12',
            'description':
                'Build powerful deltoids and improve shoulder stability and strength.',
            'video': 'https://www.youtube.com/watch?v=example9',
            'imageStart': 'images/shoulder_press_begin.jpg',
            'imageEnd': 'images/shoulder_press_end.jpg',
          },
          {
            'exercise': 'Lateral Raise',
            'sets': '3',
            'reps': '12-15',
            'description':
                'Sculpt side delts for shoulder definition and aesthetic balance.',
            'video': 'https://www.youtube.com/watch?v=example10',
            'imageStart': 'images/lateral_raise_begin.jpg',
            'imageEnd': 'images/lateral_raise_end.jpg',
          },
          {
            'exercise': 'Tricep Pushdown',
            'sets': '3',
            'reps': '12',
            'description':
                'Isolate triceps for lean muscle shaping and arm strength.',
            'video': 'https://www.youtube.com/watch?v=example11',
            'imageStart': 'images/tricep_pushdown_begin.jpg',
            'imageEnd': 'images/tricep_pushdown_end.jpg',
          },
          {
            'exercise': 'Bicep Curl',
            'sets': '3',
            'reps': '12',
            'description':
                'Develop strong, toned biceps with controlled curls for full arm definition.',
            'video': 'https://www.youtube.com/watch?v=example12',
            'imageStart': 'images/bicep_curl_begin.jpg',
            'imageEnd': 'images/bicep_curl_end.jpg',
          },
        ],
        'Day 3': [
          {
            'exercise': 'Squats',
            'sets': '4',
            'reps': '10-12',
            'description':
                'Strengthen legs and glutes while enhancing core stability and mobility.',
            'video': 'https://www.youtube.com/watch?v=example13',
            'imageStart': 'images/squats_begin.jpg',
            'imageEnd': 'images/squats_end.jpg',
          },
          {
            'exercise': 'Leg Press',
            'sets': '4',
            'reps': '12',
            'description':
                'Focus on quadriceps development for powerful and defined legs.',
            'video': 'https://www.youtube.com/watch?v=example14',
            'imageStart': 'images/leg_press_begin.jpg',
            'imageEnd': 'images/leg_press_end.jpg',
          },
          {
            'exercise': 'Romanian Deadlift',
            'sets': '3',
            'reps': '10-12',
            'description':
                'Target hamstrings and glutes to improve strength and posterior chain engagement.',
            'video': 'https://www.youtube.com/watch?v=example15',
            'imageStart': 'images/romanian_deadlift_begin.jpg',
            'imageEnd': 'images/romanian_deadlift_end.jpg',
          },
          {
            'exercise': 'Leg Curl',
            'sets': '3',
            'reps': '12-15',
            'description':
                'Isolate hamstrings for optimal shaping and muscle control.',
            'video': 'https://www.youtube.com/watch?v=example16',
            'imageStart': 'images/leg_curl_begin.jpg',
            'imageEnd': 'images/leg_curl_end.jpg',
          },
          {
            'exercise': 'Leg Extension',
            'sets': '3',
            'reps': '12',
            'description':
                'Quad isolation for sculpting and strengthening lower body.',
            'video': 'https://www.youtube.com/watch?v=example17',
            'imageStart': 'images/leg_extension_begin.jpg',
            'imageEnd': 'images/leg_extension_end.jpg',
          },
          {
            'exercise': 'Calf Raises',
            'sets': '4',
            'reps': '15-20',
            'description':
                'Enhance calf strength and definition for balanced lower legs.',
            'video': 'https://www.youtube.com/watch?v=example18',
            'imageStart': 'images/calf_raises_begin.jpg',
            'imageEnd': 'images/calf_raises_end.jpg',
          },
        ],
        'Day 4': [
          {
            'exercise': 'Plank',
            'sets': '3',
            'reps': '60 sec',
            'description':
                'Stabilize your core and strengthen abdominal muscles with controlled planks.',
            'video': 'https://www.youtube.com/watch?v=example19',
            'imageStart': 'images/plank_begin.jpg',
            'imageEnd': 'images/plank_end.jpg',
          },
          {
            'exercise': 'Russian Twists',
            'sets': '3',
            'reps': '20',
            'description':
                'Engage obliques for a toned midsection and rotational strength.',
            'video': 'https://www.youtube.com/watch?v=example20',
            'imageStart': 'images/russian_twist_begin.jpg',
            'imageEnd': 'images/russian_twist_end.jpg',
          },
          {
            'exercise': 'Mountain Climbers',
            'sets': '3',
            'reps': '30 sec',
            'description':
                'Boost core endurance and cardiovascular fitness with dynamic movement.',
            'video': 'https://www.youtube.com/watch?v=example21',
            'imageStart': 'images/mountain_climbers_begin.jpg',
            'imageEnd': 'images/mountain_climbers_end.jpg',
          },
          {
            'exercise': 'Jump Rope',
            'sets': '3',
            'reps': '1 min',
            'description':
                'Enhance cardio, coordination, and agility with high-intensity rope training.',
            'video': 'https://www.youtube.com/watch?v=example22',
            'imageStart': 'images/jump_rope_begin.jpg',
            'imageEnd': 'images/jump_rope_end.jpg',
          },
          {
            'exercise': 'Treadmill',
            'sets': '1',
            'reps': '30 min',
            'description':
                'Low-impact cardio to improve circulation and recovery.',
            'video': 'https://www.youtube.com/watch?v=example23',
            'imageStart': 'images/treadmill_begin.jpg',
            'imageEnd': 'images/treadmill_end.jpg',
          },
        ],
        'Day 5': [
          {
            'exercise': 'Walking',
            'sets': '1',
            'reps': '20 min',
            'description':
                'Full-body stretches to improve flexibility and reduce muscle tension.',
            'video': 'https://www.youtube.com/watch?v=example24',
            'imageStart': 'images/walking_begin.jpg',
            'imageEnd': 'images/walking_end.jpg',
          },
          {
            'exercise': 'Stretching',
            'sets': '-',
            'reps': '-',
            'description':
                'Mind-body practice to enhance flexibility, balance, and mental focus.',
            'video': '',
            'imageStart': 'images/stretching_begin.jpg',
            'imageEnd': 'images/stretching_end.jpg',
          },
          {
            'exercise': 'Yoga',
            'sets': '-',
            'reps': '-',
            'description': 'Mind-body exercise.',
            'video': '',
            'imageStart': 'images/yoga_begin.jpg',
            'imageEnd': 'images/yoga_end.jpg',
          },
        ],
      };
    }

    /// 🔵 MALE PRO (Bulking/Cutting/Fitness)
    final maleProgram = {
      'Day 1': [
        {
          'exercise': 'Bench Press',
          'sets': '4',
          'reps': '8-10',
          'description':
              'Build massive chest strength and size with controlled Bench Presses for optimal upper-body power.',
          'video': 'https://www.youtube.com/watch?v=gRVjAtPip0Y',
          'imageStart': 'images/hbench_press_begin.jpg',
          'imageEnd': 'images/hbench_press_end.jpg',
        },
        {
          'exercise': 'Incline Dumbbell Press',
          'sets': '4',
          'reps': '8-12',
          'description':
              'Target upper chest and shoulders for a well-balanced, sculpted torso.',
          'video': 'https://www.youtube.com/watch?v=8iPEnn-ltC8',
          'imageStart': 'images/hicline_dumbbell_press_begin.jpg',
          'imageEnd': 'images/hicline_dumbbell_press_end.jpg',
        },
        {
          'exercise': 'Chest Fly',
          'sets': '3',
          'reps': '10-12',
          'description':
              'Isolate chest muscles to enhance shaping and definition.',
          'video': 'https://www.youtube.com/watch?v=eozdVDA78K0',
          'imageStart': 'images/hchest_fly_begin.jpg',
          'imageEnd': 'images/hchest_fly_end.jpg',
        },
        {
          'exercise': 'Cable Crossover',
          'sets': '3',
          'reps': '12',
          'description':
              'Focus on chest contraction and symmetry for maximum muscle engagement.',
          'video': 'https://www.youtube.com/watch?v=E3xG7g3KGjE',
          'imageStart': 'images/hcable_crossover_begin.jpg',
          'imageEnd': 'images/hcable_crossover_end.jpg',
        },
        {
          'exercise': 'Push Ups',
          'sets': '3',
          'reps': 'max',
          'description':
              'Bodyweight chest exercise to build endurance, strength, and upper-body tone.',
          'video': 'https://www.youtube.com/watch?v=_l3ySVKYVJ8',
          'imageStart': 'images/hpushups_begin.jpg',
          'imageEnd': 'images/hpushups_end.jpg',
        },
        {
          'exercise': 'Dips',
          'sets': '3',
          'reps': '12',
          'description':
              'Develop chest and triceps simultaneously for upper-body power and definition.',
          'video': 'https://www.youtube.com/watch?v=2z8JmcrW-As',

          'imageStart': 'images/hdips_begin.jpg',
          'imageEnd': 'images/hdips_end.jpg',
        },
      ],
      'Day 2': [
        {
          'exercise': 'Pull Ups',
          'sets': '4',
          'reps': '8-10',
          'description':
              'Increase back width and build upper-body strength with focused pull-ups.',
          'video': 'https://www.youtube.com/watch?v=eGo4IYlbE5g',
          'imageStart': 'images/hpullups_begin.jpg',
          'imageEnd': 'images/hpullups_end.jpg',
        },
        {
          'exercise': 'Barbell Row',
          'sets': '4',
          'reps': '8-10',
          'description':
              'Strengthen mid-back for thickness, posture, and power.',
          'video': 'https://www.youtube.com/watch?v=vT2GjY_Umpw',
          'imageStart': 'images/hbarbell_row_begin.jpg',
          'imageEnd': 'images/hbarbell_row_end.jpg',
        },
        {
          'exercise': 'Lat Pulldown',
          'sets': '3',
          'reps': '10-12',
          'description':
              'Isolate lats for improved V-taper and upper-body strength.',
          'video': 'https://www.youtube.com/watch?v=CAwf7n6Luuc',
          'imageStart': 'images/hlat_pulldown_begin.jpg',
          'imageEnd': 'images/hlat_pulldown_end.jpg',
        },
        {
          'exercise': 'Seated Row',
          'sets': '3',
          'reps': '10-12',
          'description': 'Develop mid-back density and overall pulling power.',
          'video': 'https://www.youtube.com/watch?v=GZbfZ033f74',
          'imageStart': 'images/hseated_row_begin.jpg',
          'imageEnd': 'images/hseated_row_end.jpg',
        },
        {
          'exercise': 'Face Pull',
          'sets': '3',
          'reps': '15',
          'description':
              'Strengthen rear delts and upper back for posture and shoulder health.',
          'video': 'https://www.youtube.com/watch?v=rep-qVOkqgk',
          'imageStart': 'images/hface_pull_begin.jpg',
          'imageEnd': 'images/hface_pull_end.jpg',
        },
        {
          'exercise': 'Deadlift',
          'sets': '3',
          'reps': '5',
          'description':
              'Full-body strength builder engaging posterior chain, core, and grip.',
          'video': 'https://www.youtube.com/watch?v=r4MzxtBKyNE',
          'imageStart': 'images/hdeadlift_begin.jpg',
          'imageEnd': 'images/hdeadlift_end.jpg',
        },
      ],
      'Day 3': [
        // Legs
        {
          'exercise': 'Squats',
          'sets': '4',
          'reps': '8-10',
          'description':
              'Develop leg and glute strength while enhancing core stability and power.',
          'video': 'https://www.youtube.com/watch?v=aclHkVaku9U',
          'imageStart': 'images/hsquats_begin.jpg',
          'imageEnd': 'images/hsquats_end.jpg',
        },
        {
          'exercise': 'Leg Press',
          'sets': '4',
          'reps': '10-12',
          'description':
              'Quad-focused exercise for strong and defined lower body.',
          'video': 'https://www.youtube.com/watch?v=IZxyjW7MPJQ',
          'imageStart': 'images/hleg_press_begin.jpg',
          'imageEnd': 'images/hleg_press_end.jpg',
        },
        {
          'exercise': 'Lunges',
          'sets': '3',
          'reps': '12 each',
          'description':
              'Improve leg balance, coordination, and unilateral strength.',
          'video': 'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
          'imageStart': 'images/hlunges_begin.jpg',
          'imageEnd': 'images/hlunges_end.jpg',
        },
        {
          'exercise': 'Leg Curl',
          'sets': '3',
          'reps': '12-15',
          'description':
              'Isolate hamstrings to boost posterior chain development.',
          'video': 'https://www.youtube.com/watch?v=PY2u0gqew2I',
          'imageStart': 'images/hleg_curl_begin.jpg',
          'imageEnd': 'images/hleg_curl_end.jpg',
        },
        {
          'exercise': 'Leg Extension',
          'sets': '3',
          'reps': '12',
          'description':
              'Target quads for shaping, strength, and lower-leg aesthetics.',
          'video': 'https://www.youtube.com/watch?v=YyvSfVjQeL0',
          'imageStart': 'images/hleg_extension_begin.jpg',
          'imageEnd': 'images/hleg_extension_end.jpg',
        },
        {
          'exercise': 'Calf Raises',
          'sets': '5',
          'reps': '20',
          'description':
              'Sculpt and strengthen calves for balanced, powerful legs.',
          'video': 'https://www.youtube.com/watch?v=YMmgqO8Jo-k',
          'imageStart': 'images/hcalf_raises_begin.jpg',
          'imageEnd': 'images/hcalf_raises_end.jpg',
        },
      ],
      'Day 4': [
        {
          'exercise': 'Shoulder Press',
          'sets': '4',
          'reps': '8-10',
          'description':
              'Build deltoid strength and shoulder stability for a powerful upper body.',
          'video': 'https://www.youtube.com/watch?v=B-aVuyhvLHU',
          'imageStart': 'images/hshoulder_press_begin.jpg',
          'imageEnd': 'images/hshoulder_press_end.jpg',
        },
        {
          'exercise': 'Lateral Raise',
          'sets': '4',
          'reps': '12',
          'description':
              'Sculpt side delts for definition and aesthetic shoulder width.',
          'video': 'https://www.youtube.com/watch?v=kDqklk1ZESo',
          'imageStart': 'images/hlateral_raise_begin.jpg',
          'imageEnd': 'images/hlateral_raise_end.jpg',
        },
        {
          'exercise': 'Front Raise',
          'sets': '3',
          'reps': '12',
          'description':
              'Target front delts to improve shoulder shape and strength.',
          'video': 'https://www.youtube.com/watch?v=-t7fuZ0KhDA',
          'imageStart': 'images/hfront_raise_begin.jpg',
          'imageEnd': 'images/hfront_raise_end.jpg',
        },
        {
          'exercise': 'Reverse Fly',
          'sets': '3',
          'reps': '12',
          'description':
              'Develop rear delts and upper-back muscles for posture and balance.',
          'video': 'https://www.youtube.com/watch?v=5v32Wv4cgrk',
          'imageStart': 'images/hreverse_fly_begin.jpg',
          'imageEnd': 'images/hreverse_fly_end.jpg',
        },
        {
          'exercise': 'Shrugs',
          'sets': '4',
          'reps': '15',
          'description':
              'Isolate traps to build size, strength, and upper-back thickness.',
          'video': 'https://www.youtube.com/watch?v=0qj4WTmxmAU',
          'imageStart': 'images/hshrugs_begin.jpg',
          'imageEnd': 'images/hshrugs_end.jpg',
        },
      ],
      'Day 5': [
        {
          'exercise': 'Barbell Curl',
          'sets': '4',
          'reps': '10',
          'description':
              'Build biceps mass and arm strength with controlled barbell curls.',
          'video': 'https://www.youtube.com/watch?v=kwG2ipFRgfo',
          'imageStart': 'images/hbarbell_curl_begin.jpg',
          'imageEnd': 'images/hbarbell_curl_end.jpg',
        },
        {
          'exercise': 'Hammer Curl',
          'sets': '3',
          'reps': '12',
          'description':
              'Develop biceps and forearms for balanced arm definition.',
          'video': 'https://www.youtube.com/watch?v=zC3nLlEvin4',
          'imageStart': 'images/hhammer_curl_begin.jpg',
          'imageEnd': 'images/hhammer_curl_end.jpg',
        },
        {
          'exercise': 'Tricep Pushdown',
          'sets': '4',
          'reps': '12',
          'description':
              'Isolate triceps for lean muscle shaping and arm strength.',
          'video': 'https://www.youtube.com/watch?v=2-LAMcpzODU',
          'imageStart': 'images/htricep_pushdown_begin.jpg',
          'imageEnd': 'images/htricep_pushdown_end.jpg',
        },
        {
          'exercise': 'Skull Crushers',
          'sets': '3',
          'reps': '10',
          'description':
              'Target the long head of the triceps for arm fullness and power.',
          'video': 'https://www.youtube.com/watch?v=d_KZxkY_0cM',
          'imageStart': 'images/hskull_crushers_begin.jpg',
          'imageEnd': 'images/hskull_crushers_end.jpg',
        },
        {
          'exercise': 'Dips',
          'sets': '3',
          'reps': 'max',
          'description':
              'Bodyweight chest and triceps builder to enhance upper-body tone.',
          'video': 'https://www.youtube.com/watch?v=2z8JmcrW-As',
          'imageStart': 'images/hdips_begin.jpg',
          'imageEnd': 'images/hdips_end.jpg',
        },
      ],
    };

    /// ✅ Adjust program by goal
    if (goal == 'Bulking') {
      return maleProgram;
    } else if (goal == 'Cutting') {
      // Example cutting adjustments
      maleProgram['Day 1'] = [
        {
          'exercise': 'Treadmill',
          'sets': '1',
          'reps': '30 min',
          'description': 'Cardio for fat loss.',
          'video': 'https://www.youtube.com/watch?v=example_cut1',
          'imageStart': 'images/treadmill_begin.jpg',
          'imageEnd': 'images/treadmill_end.jpg',
        },
        {
          'exercise': 'Jump Rope',
          'sets': '3',
          'reps': '1 min',
          'description': 'High-intensity cardio.',
          'video': 'https://www.youtube.com/watch?v=example_cut2',
          'imageStart': 'images/jump_rope_begin.jpg',
          'imageEnd': 'images/jump_rope_end.jpg',
        },
      ];
      maleProgram['Day 4'] = [
        {
          'exercise': 'Full Body Circuit',
          'sets': '4',
          'reps': '12 each',
          'description': 'Fat-burning full body.',
          'video': 'https://www.youtube.com/watch?v=example_cut3',
          'imageStart': 'images/full_body_circuit_begin.jpg',
          'imageEnd': 'images/full_body_circuit_end.jpg',
        },
      ];
      return maleProgram;
    } else {
      // Fitness / Maintenance
      return maleProgram;
    }
  }
}
