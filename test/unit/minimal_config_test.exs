defmodule Unit.MinimalConfigSmokeTest do
  use ExUnit.Case

  setup_all do
    Application.fetch_env!(:lambda_ethereum_consensus, ChainSpec)
    |> Keyword.put(:config, MinimalConfig)
    |> then(&Application.put_env(:lambda_ethereum_consensus, ChainSpec, &1))
  end

  test "in minimal, SLOTS_PER_EPOCH == 8" do
    # Chosen because it's unlikely to change
    assert ChainSpec.get("SLOTS_PER_EPOCH") == 8
  end
end
