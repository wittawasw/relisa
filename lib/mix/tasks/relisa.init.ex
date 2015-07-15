defmodule Mix.Tasks.Relisa.Init do
  use Mix.Task

  @shortdoc "Creates a relisa.exs config file"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    Mix.shell.info "I'm about to create a config file for relisa, and add an import line to your `config.exs`"
    if Mix.shell.yes?("Do you want to continue?") do
      Mix.Relisa.copy_from source_dir, "", [assigns: []], [
        {:eex, "relisa.exs", "config/relisa.exs"}
      ]
      import_line = "\nimport_config \"relisa.exs\""
      File.write!("config/config.exs", import_line, [:append])
    end
  end

  defp source_dir do
    Application.app_dir(:relisa, "priv/templates")
  end
end
