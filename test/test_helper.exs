ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ReaderEx.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ReaderEx.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ReaderEx.Repo)

