defmodule AuthStarter.PostResolver do
  alias AuthStarter.Posts

  def all(_args, _info) do
    {:ok, Posts.list_posts()}
  end
end
