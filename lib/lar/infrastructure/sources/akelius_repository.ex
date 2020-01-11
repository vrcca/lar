defmodule Lar.Infrastructure.Sources.AkeliusRepository do
  alias HTTPoison.Response

  def fetch_offers() do
    HTTPoison.get(offers_resource())
    |> to_offer()
  end

  defp to_offer({:ok, %Response{body: body}}) do
    Jason.decode!(body, keys: :atoms)
    |> Map.get(:data)
  end

  defp offers_resource() do
    url = Application.get_env(:lar, :akelius_api_url)
    url <> "/lettings/marketing/units?countryCode=DE"
  end
end
