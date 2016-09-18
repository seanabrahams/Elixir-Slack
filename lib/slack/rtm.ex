defmodule Slack.Rtm do
  @moduledoc false
  def start(token) do
    case HTTPoison.get(Application.get_env(:slack, :api_url) <> "/rtm.start?token=" <> token) do
      {:ok, response} ->
        json = JSX.decode!(response.body, [{:labels, :atom}])
        {:ok, json}
      {:error, reason} -> {:error, reason}
    end
  end
end
