# defmodule AuthStarterWeb.Context do
#   @behaviour Plug
#
#   import Plug.Conn
#   import Ecto.Query, only: [where: 2]
#
#   alias AuthStarter.Repo
#   alias AuthStarter.Accounts.User
#
#   def init(opts), do: opts
#
#   def call(conn, _) do
#     context = build_context(conn)
#     put_private(conn, :absinthe, %{context: context})
#   end
#
#   defp build_context(conn) do
#     with ["Bearer " <> token] <- get_req_header(conn, "authrization"),
#     {:ok, current_user} <- authorize(token) do
#       %{current_user: current_user}
#     else
#       _ -> %{}
#     end
#   end
#
#   defp authorize(token) do
#     User
#     |> where(token: token)
#     |> Repo.one
#     |> case do
#       nil -> {:error, "Invalid authorization token"}
#       user -> {:ok, user}
#     end
#   end
# end
