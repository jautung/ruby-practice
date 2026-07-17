class TwoBucket
  State = Data.define(:bucket_1, :bucket_2)
  Result = Data.define(:num_moves, :bucket, :num_liters_other)

  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket_1, bucket_2, desired, initial)
    raise ArgumentError unless %w[one two].include?(initial)
    result = compute_result(bucket_1, bucket_2, desired, initial)
    @moves = result.num_moves
    @goal_bucket = result.bucket
    @other_bucket = result.num_liters_other
  end

  private def compute_result(bucket_1, bucket_2, desired, initial)
    ground_state = State.new(0, 0)
    case initial
    when "one"
      initial_state = State.new(bucket_1, 0)
      forbidden_state = State.new(0, bucket_2)
      return Result.new(1, initial, 0) if desired == bucket_1
    when "two"
      initial_state = State.new(0, bucket_2)
      forbidden_state = State.new(bucket_1, 0)
      return Result.new(1, initial, 0) if desired == bucket_2
    end

    state_to_num_moves = {}
    state_to_num_moves[ground_state] = 0
    state_to_num_moves[initial_state] = 1

    queue = Queue.new
    queue << initial_state
    while !queue.empty?
      curr_state = queue.pop
      curr_num_moves = state_to_num_moves[curr_state]
      maybe_next_states = []

      # Pour bucket 1 -> bucket 2
      if curr_state.bucket_1 > 0 && curr_state.bucket_2 < bucket_2
        pour_amount = [curr_state.bucket_1, bucket_2 - curr_state.bucket_2].min
        maybe_next_states << State.new(curr_state.bucket_1 - pour_amount, curr_state.bucket_2 + pour_amount)
      end

      # Pour bucket 2 -> bucket 1
      if curr_state.bucket_2 > 0 && curr_state.bucket_1 < bucket_1
        pour_amount = [curr_state.bucket_2, bucket_1 - curr_state.bucket_1].min
        maybe_next_states << State.new(curr_state.bucket_1 + pour_amount, curr_state.bucket_2 - pour_amount)
      end

      # Empty bucket 1
      if curr_state.bucket_1 > 0
        maybe_next_states << State.new(0, curr_state.bucket_2)
      end

      # Empty bucket 2
      if curr_state.bucket_2 > 0
        maybe_next_states << State.new(curr_state.bucket_1, 0)
      end

      # Fill bucket 1
      if curr_state.bucket_1 < bucket_1
        maybe_next_states << State.new(bucket_1, curr_state.bucket_2)
      end

      # Fill bucket 2
      if curr_state.bucket_2 < bucket_2
        maybe_next_states << State.new(curr_state.bucket_1, bucket_2)
      end

      valid_next_states = maybe_next_states.select do |state|
        next false if state == forbidden_state
        next false if state_to_num_moves.include?(state)
        true
      end

      valid_next_states.each do |state|
        return Result.new(curr_num_moves + 1, "one", state.bucket_2) if desired == state.bucket_1
        return Result.new(curr_num_moves + 1, "two", state.bucket_1) if desired == state.bucket_2
        queue << state
        state_to_num_moves[state] = curr_num_moves + 1
      end
    end

    raise
  end
end

TwoBucket.new(3, 5, 1, "one")
TwoBucket.new(3, 5, 1, "two")
TwoBucket.new(7, 11, 2, "one")