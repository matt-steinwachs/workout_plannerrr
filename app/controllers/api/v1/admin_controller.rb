class Api::V1::AdminController < ApplicationController
  before_action :set_block, only: [:show, :update, :destroy]

  # GET /export
  def export
    render json: JSON.pretty_generate({
      references: Reference.all.as_json,
      exercises: Exercise.all.as_json,
      cycle_templates: CycleTemplate.all.as_json,
      workout_templates: WorkoutTemplate.all.as_json,
      block_templates: BlockTemplate.all.as_json,
      round_templates: RoundTemplate.all.as_json,
      cycles: Cycle.all.as_json,
      workouts: Workout.all.as_json,
      blocks: Block.all.as_json,
      rounds: Round.all.as_json,
    })
  end

  # POST /import
  def import
      data = JSON.parse(params[:data])

      # JSON.parse('{"exercises":[{"id":1,"name":"Snatch","reference_id":2,"created_at":"2020-07-13T19:39:58.975Z","updated_at":"2020-07-13T19:39:58.975Z"},{"id":2,"name":"Clean \u0026 Jerk","reference_id":3,"created_at":"2020-07-13T21:43:55.819Z","updated_at":"2020-07-13T21:43:55.819Z"},{"id":3,"name":"Back Extension","reference_id":1,"created_at":"2020-07-14T02:37:44.666Z","updated_at":"2020-07-14T02:37:44.666Z"},{"id":4,"name":"Muscle Snatch","reference_id":2,"created_at":"2020-07-14T02:38:01.501Z","updated_at":"2020-07-14T02:38:01.501Z"},{"id":5,"name":"Clean","reference_id":3,"created_at":"2020-07-14T02:38:25.638Z","updated_at":"2020-07-14T02:38:25.638Z"},{"id":6,"name":"Clean Pull","reference_id":3,"created_at":"2020-07-14T02:38:36.081Z","updated_at":"2020-07-14T02:38:36.081Z"},{"id":7,"name":"Front Squat","reference_id":5,"created_at":"2020-07-14T02:38:44.695Z","updated_at":"2020-07-14T02:38:44.695Z"},{"id":8,"name":"Toes to Bar","reference_id":1,"created_at":"2020-07-14T02:38:53.376Z","updated_at":"2020-07-14T02:38:53.376Z"},{"id":9,"name":"Good Morning","reference_id":4,"created_at":"2020-07-14T19:34:34.579Z","updated_at":"2020-07-14T19:34:34.579Z"},{"id":10,"name":"Snatch Balance + Overhead Squat","reference_id":2,"created_at":"2020-07-14T19:36:20.385Z","updated_at":"2020-07-14T19:36:20.385Z"},{"id":11,"name":"Sots Press","reference_id":3,"created_at":"2020-07-15T05:05:03.868Z","updated_at":"2020-07-15T05:05:03.868Z"},{"id":12,"name":"Box Jump","reference_id":1,"created_at":"2020-07-15T05:07:41.875Z","updated_at":"2020-07-15T05:07:41.875Z"},{"id":13,"name":"Snatch + Hang Snatch","reference_id":2,"created_at":"2020-07-15T05:18:18.418Z","updated_at":"2020-07-15T05:18:18.418Z"},{"id":14,"name":"Snatch High Pull","reference_id":2,"created_at":"2020-07-15T05:18:30.610Z","updated_at":"2020-07-15T05:18:30.610Z"},{"id":15,"name":"Snatch Grip BTN Press","reference_id":2,"created_at":"2020-07-15T05:18:47.700Z","updated_at":"2020-07-15T05:18:47.700Z"},{"id":16,"name":"Rack Jerk","reference_id":3,"created_at":"2020-07-15T05:32:47.478Z","updated_at":"2020-07-15T05:32:47.478Z"},{"id":17,"name":"Back Squat","reference_id":4,"created_at":"2020-07-15T05:34:35.386Z","updated_at":"2020-07-15T05:34:35.386Z"}],"references":[{"id":1,"name":"Body Weight","value":155,"created_at":"2020-07-13T19:36:59.052Z","updated_at":"2020-07-13T19:37:53.299Z"},{"id":2,"name":"Max Snatch","value":145,"created_at":"2020-07-13T19:38:24.489Z","updated_at":"2020-07-13T19:38:24.489Z"},{"id":3,"name":"Max Clean \u0026 Jerk","value":185,"created_at":"2020-07-13T19:38:34.096Z","updated_at":"2020-07-13T19:38:34.096Z"},{"id":4,"name":"Max Back Squat","value":205,"created_at":"2020-07-13T19:38:45.719Z","updated_at":"2020-07-13T19:38:45.719Z"},{"id":5,"name":"Max Front Squat","value":195,"created_at":"2020-07-13T19:39:05.108Z","updated_at":"2020-07-13T19:39:05.108Z"}],"cycle_templates":[{"id":1,"name":"TorokhtiyATG","created_at":"2020-07-14T04:38:44.606Z","updated_at":"2020-07-14T17:05:32.245Z"}],"cycles":[{"id":18,"name":"TorokhtiyATG2","cycle_template_id":1,"start":"2020-07-15T23:28:42.343Z","end":null,"references":[{"id":1,"name":"Body Weight","value":155,"created_at":"2020-07-13T19:36:59.052Z","updated_at":"2020-07-13T19:37:53.299Z"},{"id":2,"name":"Max Snatch","value":145,"created_at":"2020-07-13T19:38:24.489Z","updated_at":"2020-07-13T19:38:24.489Z"},{"id":3,"name":"Max Clean \u0026 Jerk","value":185,"created_at":"2020-07-13T19:38:34.096Z","updated_at":"2020-07-13T19:38:34.096Z"},{"id":4,"name":"Max Back Squat","value":205,"created_at":"2020-07-13T19:38:45.719Z","updated_at":"2020-07-13T19:38:45.719Z"},{"id":5,"name":"Max Front Squat","value":195,"created_at":"2020-07-13T19:39:05.108Z","updated_at":"2020-07-13T19:39:05.108Z"}],"created_at":"2020-07-15T23:28:42.345Z","updated_at":"2020-07-15T23:28:56.647Z"}],"workout_templates":[{"id":7,"name":"TorATG W1 Mon","cycle_template_id":1,"created_at":"2020-07-14T17:50:25.391Z","updated_at":"2020-07-14T17:50:25.391Z"},{"id":10,"name":"TorATG W1 Tue","cycle_template_id":1,"created_at":"2020-07-14T20:09:56.234Z","updated_at":"2020-07-14T20:09:56.234Z"},{"id":11,"name":"C\u0026J EMOM 20","cycle_template_id":null,"created_at":"2020-07-14T20:12:32.458Z","updated_at":"2020-07-14T20:12:32.458Z"},{"id":12,"name":"TorATG W1 Thu","cycle_template_id":1,"created_at":"2020-07-15T05:23:38.446Z","updated_at":"2020-07-15T05:23:38.446Z"},{"id":13,"name":"TorATG W3 Wed","cycle_template_id":1,"created_at":"2020-07-15T05:35:52.982Z","updated_at":"2020-07-15T06:07:45.545Z"}],"workouts":[{"id":14,"name":"C\u0026J EMOM 20","cycle_id":18,"workout_template_id":11,"start":"2020-07-15T23:28:56.648Z","end":"2020-07-15T23:32:34.959Z","created_at":"2020-07-15T23:28:56.648Z","updated_at":"2020-07-15T23:32:34.991Z"}],"block_templates":[{"id":13,"workout_template_id":7,"exercise_id":3,"created_at":"2020-07-14T17:50:25.395Z","updated_at":"2020-07-14T17:50:25.395Z"},{"id":14,"workout_template_id":7,"exercise_id":4,"created_at":"2020-07-14T17:50:25.402Z","updated_at":"2020-07-14T17:50:25.402Z"},{"id":15,"workout_template_id":7,"exercise_id":5,"created_at":"2020-07-14T17:50:25.413Z","updated_at":"2020-07-14T17:50:25.413Z"},{"id":16,"workout_template_id":7,"exercise_id":6,"created_at":"2020-07-14T17:53:11.421Z","updated_at":"2020-07-14T17:53:11.421Z"},{"id":17,"workout_template_id":7,"exercise_id":7,"created_at":"2020-07-14T17:53:11.427Z","updated_at":"2020-07-14T17:53:11.427Z"},{"id":18,"workout_template_id":7,"exercise_id":8,"created_at":"2020-07-14T17:53:11.432Z","updated_at":"2020-07-14T17:53:11.432Z"},{"id":21,"workout_template_id":10,"exercise_id":9,"created_at":"2020-07-14T20:09:56.235Z","updated_at":"2020-07-14T20:09:56.235Z"},{"id":22,"workout_template_id":10,"exercise_id":10,"created_at":"2020-07-14T20:09:56.239Z","updated_at":"2020-07-14T20:09:56.239Z"},{"id":23,"workout_template_id":11,"exercise_id":2,"created_at":"2020-07-14T20:12:32.460Z","updated_at":"2020-07-14T20:12:32.460Z"},{"id":26,"workout_template_id":10,"exercise_id":11,"created_at":"2020-07-15T05:10:00.787Z","updated_at":"2020-07-15T05:10:00.787Z"},{"id":27,"workout_template_id":10,"exercise_id":2,"created_at":"2020-07-15T05:11:26.001Z","updated_at":"2020-07-15T05:11:26.001Z"},{"id":28,"workout_template_id":10,"exercise_id":12,"created_at":"2020-07-15T05:13:21.743Z","updated_at":"2020-07-15T05:13:21.743Z"},{"id":29,"workout_template_id":10,"exercise_id":8,"created_at":"2020-07-15T05:13:21.746Z","updated_at":"2020-07-15T05:13:21.746Z"},{"id":30,"workout_template_id":12,"exercise_id":9,"created_at":"2020-07-15T05:23:38.448Z","updated_at":"2020-07-15T05:23:38.448Z"},{"id":31,"workout_template_id":12,"exercise_id":13,"created_at":"2020-07-15T05:23:38.450Z","updated_at":"2020-07-15T05:23:38.450Z"},{"id":32,"workout_template_id":12,"exercise_id":14,"created_at":"2020-07-15T05:23:38.452Z","updated_at":"2020-07-15T05:23:38.452Z"},{"id":33,"workout_template_id":12,"exercise_id":15,"created_at":"2020-07-15T05:23:38.453Z","updated_at":"2020-07-15T05:23:38.453Z"},{"id":34,"workout_template_id":12,"exercise_id":12,"created_at":"2020-07-15T05:23:38.456Z","updated_at":"2020-07-15T05:23:38.456Z"},{"id":35,"workout_template_id":12,"exercise_id":8,"created_at":"2020-07-15T05:23:38.458Z","updated_at":"2020-07-15T05:23:38.458Z"},{"id":36,"workout_template_id":13,"exercise_id":3,"created_at":"2020-07-15T05:35:52.992Z","updated_at":"2020-07-15T05:35:52.992Z"},{"id":37,"workout_template_id":13,"exercise_id":13,"created_at":"2020-07-15T05:35:52.994Z","updated_at":"2020-07-15T05:35:52.994Z"},{"id":38,"workout_template_id":13,"exercise_id":16,"created_at":"2020-07-15T05:35:53.000Z","updated_at":"2020-07-15T05:35:53.000Z"},{"id":39,"workout_template_id":13,"exercise_id":17,"created_at":"2020-07-15T05:35:53.005Z","updated_at":"2020-07-15T05:35:53.005Z"}],"blocks":[{"id":55,"workout_id":14,"exercise_id":2,"block_template_id":23,"start":null,"end":null,"created_at":"2020-07-15T23:28:56.655Z","updated_at":"2020-07-15T23:28:56.655Z"}],"round_templates":[{"id":23,"block_template_id":13,"reps":"10","sets":4,"percent":null,"weight":10,"created_at":"2020-07-14T17:50:25.398Z","updated_at":"2020-07-14T17:50:25.398Z"},{"id":24,"block_template_id":14,"reps":"6","sets":2,"percent":null,"weight":45,"created_at":"2020-07-14T17:50:25.404Z","updated_at":"2020-07-14T17:50:25.404Z"},{"id":25,"block_template_id":14,"reps":"5","sets":2,"percent":null,"weight":65,"created_at":"2020-07-14T17:50:25.408Z","updated_at":"2020-07-14T17:50:25.408Z"},{"id":26,"block_template_id":14,"reps":"4","sets":3,"percent":null,"weight":85,"created_at":"2020-07-14T17:50:25.410Z","updated_at":"2020-07-14T17:50:25.410Z"},{"id":27,"block_template_id":15,"reps":"3","sets":2,"percent":0.5,"weight":null,"created_at":"2020-07-14T17:50:25.416Z","updated_at":"2020-07-14T17:50:25.416Z"},{"id":28,"block_template_id":15,"reps":"3","sets":3,"percent":0.6,"weight":null,"created_at":"2020-07-14T17:50:25.417Z","updated_at":"2020-07-14T17:50:25.417Z"},{"id":29,"block_template_id":15,"reps":"3","sets":4,"percent":0.7,"weight":null,"created_at":"2020-07-14T17:50:25.419Z","updated_at":"2020-07-14T17:50:25.419Z"},{"id":30,"block_template_id":16,"reps":"3","sets":2,"percent":0.6,"weight":null,"created_at":"2020-07-14T17:53:11.423Z","updated_at":"2020-07-14T17:53:11.423Z"},{"id":31,"block_template_id":16,"reps":"3","sets":2,"percent":0.7,"weight":null,"created_at":"2020-07-14T17:53:11.424Z","updated_at":"2020-07-14T17:53:11.424Z"},{"id":32,"block_template_id":16,"reps":"3","sets":3,"percent":0.8,"weight":null,"created_at":"2020-07-14T17:53:11.425Z","updated_at":"2020-07-14T17:53:11.425Z"},{"id":33,"block_template_id":16,"reps":"3","sets":3,"percent":0.85,"weight":null,"created_at":"2020-07-14T17:53:11.426Z","updated_at":"2020-07-14T17:53:11.426Z"},{"id":34,"block_template_id":17,"reps":"3","sets":2,"percent":0.5,"weight":null,"created_at":"2020-07-14T17:53:11.428Z","updated_at":"2020-07-14T17:53:11.428Z"},{"id":35,"block_template_id":17,"reps":"3","sets":2,"percent":0.6,"weight":null,"created_at":"2020-07-14T17:53:11.430Z","updated_at":"2020-07-14T17:53:11.430Z"},{"id":36,"block_template_id":17,"reps":"3","sets":2,"percent":0.7,"weight":null,"created_at":"2020-07-14T17:53:11.431Z","updated_at":"2020-07-14T17:53:11.431Z"},{"id":37,"block_template_id":18,"reps":"10","sets":10,"percent":null,"weight":null,"created_at":"2020-07-14T17:53:11.433Z","updated_at":"2020-07-14T17:53:11.433Z"},{"id":40,"block_template_id":21,"reps":"8","sets":2,"percent":null,"weight":45,"created_at":"2020-07-14T20:09:56.237Z","updated_at":"2020-07-14T20:09:56.237Z"},{"id":41,"block_template_id":21,"reps":"6","sets":2,"percent":null,"weight":65,"created_at":"2020-07-14T20:09:56.238Z","updated_at":"2020-07-14T20:09:56.238Z"},{"id":42,"block_template_id":22,"reps":"[3,3]","sets":2,"percent":0.5,"weight":null,"created_at":"2020-07-14T20:09:56.240Z","updated_at":"2020-07-14T20:09:56.240Z"},{"id":43,"block_template_id":22,"reps":"[3,3]","sets":2,"percent":0.6,"weight":null,"created_at":"2020-07-14T20:09:56.273Z","updated_at":"2020-07-14T20:09:56.273Z"},{"id":44,"block_template_id":23,"reps":"1","sets":20,"percent":0.85,"weight":null,"created_at":"2020-07-14T20:12:32.461Z","updated_at":"2020-07-14T20:13:04.712Z"},{"id":47,"block_template_id":26,"reps":"6","sets":4,"percent":null,"weight":45,"created_at":"2020-07-15T05:10:00.788Z","updated_at":"2020-07-15T05:10:00.788Z"},{"id":48,"block_template_id":26,"reps":"3","sets":4,"percent":null,"weight":65,"created_at":"2020-07-15T05:10:00.789Z","updated_at":"2020-07-15T05:10:00.789Z"},{"id":49,"block_template_id":27,"reps":"[3,3]","sets":5,"percent":0.5,"weight":null,"created_at":"2020-07-15T05:11:26.003Z","updated_at":"2020-07-15T05:11:26.003Z"},{"id":50,"block_template_id":28,"reps":"10","sets":10,"percent":null,"weight":null,"created_at":"2020-07-15T05:13:21.744Z","updated_at":"2020-07-15T05:13:21.744Z"},{"id":51,"block_template_id":29,"reps":"10","sets":10,"percent":null,"weight":null,"created_at":"2020-07-15T05:13:21.747Z","updated_at":"2020-07-15T05:13:21.747Z"},{"id":52,"block_template_id":30,"reps":"10","sets":2,"percent":null,"weight":55,"created_at":"2020-07-15T05:23:38.449Z","updated_at":"2020-07-15T05:23:38.449Z"},{"id":53,"block_template_id":30,"reps":"8","sets":2,"percent":null,"weight":75,"created_at":"2020-07-15T05:23:38.449Z","updated_at":"2020-07-15T05:23:38.449Z"},{"id":54,"block_template_id":31,"reps":"[4,4]","sets":6,"percent":0.5,"weight":null,"created_at":"2020-07-15T05:23:38.451Z","updated_at":"2020-07-15T05:23:38.451Z"},{"id":55,"block_template_id":32,"reps":"3","sets":5,"percent":0.6,"weight":null,"created_at":"2020-07-15T05:23:38.453Z","updated_at":"2020-07-15T05:23:38.453Z"},{"id":56,"block_template_id":33,"reps":"5","sets":5,"percent":null,"weight":65,"created_at":"2020-07-15T05:23:38.454Z","updated_at":"2020-07-15T05:23:38.454Z"},{"id":57,"block_template_id":34,"reps":"10","sets":10,"percent":null,"weight":null,"created_at":"2020-07-15T05:23:38.457Z","updated_at":"2020-07-15T05:23:38.457Z"},{"id":58,"block_template_id":35,"reps":"10","sets":10,"percent":null,"weight":null,"created_at":"2020-07-15T05:23:38.490Z","updated_at":"2020-07-15T05:23:38.490Z"},{"id":59,"block_template_id":36,"reps":"10","sets":2,"percent":null,"weight":null,"created_at":"2020-07-15T05:35:52.993Z","updated_at":"2020-07-15T05:35:52.993Z"},{"id":60,"block_template_id":37,"reps":"[1,1]","sets":2,"percent":0.7,"weight":0,"created_at":"2020-07-15T05:35:52.996Z","updated_at":"2020-07-15T06:07:32.120Z"},{"id":61,"block_template_id":37,"reps":"[1,1]","sets":2,"percent":0.75,"weight":0,"created_at":"2020-07-15T05:35:52.997Z","updated_at":"2020-07-15T06:07:32.123Z"},{"id":62,"block_template_id":37,"reps":"[1,1]","sets":2,"percent":0.8,"weight":0,"created_at":"2020-07-15T05:35:52.998Z","updated_at":"2020-07-15T06:07:32.125Z"},{"id":63,"block_template_id":37,"reps":"[1,1]","sets":2,"percent":0.9,"weight":0,"created_at":"2020-07-15T05:35:52.999Z","updated_at":"2020-07-15T06:07:32.149Z"},{"id":64,"block_template_id":38,"reps":"3","sets":2,"percent":0.5,"weight":null,"created_at":"2020-07-15T05:35:53.001Z","updated_at":"2020-07-15T05:35:53.001Z"},{"id":65,"block_template_id":38,"reps":"3","sets":2,"percent":0.6,"weight":null,"created_at":"2020-07-15T05:35:53.003Z","updated_at":"2020-07-15T05:35:53.003Z"},{"id":66,"block_template_id":38,"reps":"2","sets":4,"percent":0.7,"weight":null,"created_at":"2020-07-15T05:35:53.004Z","updated_at":"2020-07-15T05:35:53.004Z"},{"id":67,"block_template_id":39,"reps":"4","sets":1,"percent":0.5,"weight":null,"created_at":"2020-07-15T05:35:53.006Z","updated_at":"2020-07-15T05:35:53.006Z"},{"id":68,"block_template_id":39,"reps":"3","sets":2,"percent":0.6,"weight":null,"created_at":"2020-07-15T05:35:53.007Z","updated_at":"2020-07-15T05:35:53.007Z"},{"id":69,"block_template_id":39,"reps":"3","sets":1,"percent":0.7,"weight":null,"created_at":"2020-07-15T05:35:53.008Z","updated_at":"2020-07-15T05:35:53.008Z"},{"id":70,"block_template_id":39,"reps":"3","sets":2,"percent":0.8,"weight":null,"created_at":"2020-07-15T05:35:53.008Z","updated_at":"2020-07-15T05:35:53.008Z"},{"id":71,"block_template_id":39,"reps":"2","sets":4,"percent":0.9,"weight":null,"created_at":"2020-07-15T05:35:53.009Z","updated_at":"2020-07-15T05:35:53.009Z"}],"rounds":[{"id":110,"block_id":55,"reps":"1","sets":20,"weight":157,"round_template_id":44,"start":null,"end":null,"created_at":"2020-07-15T23:28:56.659Z","updated_at":"2020-07-15T23:28:56.659Z"}]}')

      Cycle.destroy_all
      WorkoutTemplate.destroy_all
      CycleTemplate.destroy_all
      Exercise.destroy_all
      Reference.destroy_all

      data["references"].each do |r|
        new_r = Reference.new(
          name: r["name"],
          value:r["value"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["exercises"].each do |r|
        new_r = Exercise.new(
          name: r["name"],
          reference_id:r["reference_id"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["cycle_templates"].each do |r|
        new_r = CycleTemplate.new(name: r["name"])
        new_r.id = r["id"]
        new_r.save!
      end
      data["workout_templates"].each do |r|
        new_r = WorkoutTemplate.new(
          name: r["name"],
          cycle_template_id: r["cycle_template_id"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["block_templates"].each do |r|
        new_r = BlockTemplate.new(
          exercise_id: r["exercise_id"],
          workout_template_id: r["workout_template_id"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["round_templates"].each do |r|
        new_r = RoundTemplate.new(
          block_template_id: r["block_template_id"],
          reps: r["reps"],
          sets: r["sets"],
          percent: r["percent"],
          weight: r["weight"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["cycles"].each do |r|
        new_r = Cycle.new(
          name: r["name"],
          cycle_template_id: r["cycle_template_id"],
          start: r["start"],
          end: r["end"],
          references: r["references"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["workouts"].each do |r|
        new_r = Workout.new(
          name: r["name"],
          cycle_id: r["cycle_id"],
          workout_template_id: r["workout_template_id"],
          start: r["start"],
          end: r["end"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["blocks"].each do |r|
        new_r = Block.new(
          exercise_id: r["exercise_id"],
          block_template_id: r["block_template_id"],
          workout_id: r["workout_id"],
          start: r["start"],
          end: r["end"]
        )
        new_r.id = r["id"]
        new_r.save!
      end
      data["rounds"].each do |r|
        new_r = Round.new(
          round_template_id: r["round_template_id"],
          block_id: r["block_id"],
          reps: r["reps"],
          sets: r["sets"],
          weight: r["weight"],
          start: r["start"],
          end: r["end"]
        )
        new_r.id = r["id"]
        new_r.save!
      end

      render json: {status: "Import Successful"}
  end

  def reset
    Cycle.destroy_all
  end
end
