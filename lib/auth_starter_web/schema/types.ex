defmodule AuthStarterWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias AuthStarterWeb.Schema.Types

  import_types(Types.PostType)
  import_types(Types.UserType)
  import_types(Types.SessionType)
end
