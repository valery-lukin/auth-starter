defmodule AuthStarter.Accounts.Session do
  alias AuthStarter.Accounts.User
  alias AuthStarter.Repo

  def authenticate(%{email: email, password: _password} = args) do
    user = Repo.get_by(User, email: String.downcase(email))

    case check_password?(user, args) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end

  defp check_password?(nil, _args), do: Comeonin.Bcrypt.dummy_checkpw()

  defp check_password?(%User{} = user, args), do:  Comeonin.Bcrypt.checkpw(args.password, user.password_hash)

end
