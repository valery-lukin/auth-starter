defmodule AuthStarter.UserResolver do
  alias AuthStarter.Accounts

  def all(_args, _info, _conn) do
    {:ok, Accounts.list_users()}
  end

  def find(%{id: id}, _info) do
    case Accounts.get_user!(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def update(%{id: id, user: user_params}, _info) do
    Accounts.get_user!(id)
    |> Accounts.update_user(user_params)
  end
end
