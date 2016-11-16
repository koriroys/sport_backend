# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SportBackend.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias SportBackend.Repo
alias SportBackend.Exercise

# abs
Repo.insert!(%Exercise{title: "Knee Tucks", power_rating: 1, progression_reps: 40, progression_sets: 3})

# arms - pushups
Repo.insert!(%Exercise{title: "Wall Pushup", power_rating: 1, progression_reps: 50, progression_sets: 3})
Repo.insert!(%Exercise{title: "Incline Pushup", power_rating: 1, progression_reps: 40, progression_sets: 3})

# arms - pullups
Repo.insert!(%Exercise{title: "Vertical Pulls", power_rating: 1, progression_reps: 50, progression_sets: 3})
Repo.insert!(%Exercise{title: "Horizontal Pulls", power_rating: 1, progression_reps: 30, progression_sets: 3})

# legs - squats
Repo.insert!(%Exercise{title: "Shoulderstand Squats", power_rating: 1, progression_reps: 50, progression_sets: 3})
Repo.insert!(%Exercise{title: "Jackknife Squats", power_rating: 1, progression_reps: 40, progression_sets: 3})
