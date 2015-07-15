defmodule Mix.Tasks.Relisa.Rollback do
  use Mix.Task

  @shortdoc "Rolls back the current OTP release to a previous release (if able)"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run([version|_]) do
    Relisa.line_break
    Relisa.say "Performing rollback across targets"
    rollback_to_version version
  end

  defp rollback_to_version(version) do
    Enum.each targets, fn ({host, key}) ->
      Relisa.subsay "#{host}: Rolling back to version #{version}"
      Mix.Shell.IO.cmd "ssh #{host} -i#{key} \"sudo #{deploy_path}/bin/#{config[:app]} downgrade '#{version}'\""
    end
  end

  defp config do
    Mix.Project.config()
  end

  defp targets do
    Application.get_env(:relisa, :targets)
  end

  defp deploy_path do
    "~/#{config[:app]}"
  end
end
