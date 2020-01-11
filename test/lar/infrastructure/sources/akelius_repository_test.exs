defmodule Lar.Infrastructure.Sources.AkeliusRepositoryTest do
  use ExUnit.Case, async: true

  @repository Lar.Infrastructure.Sources.AkeliusRepository

  @tag :integration
  test "parses body into offer" do
    offers = @repository.fetch_offers()
    assert Enum.empty?(offers) == false
  end
end
