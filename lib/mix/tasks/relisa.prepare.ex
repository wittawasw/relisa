defmodule Mix.Tasks.Relisa.Prepare do
  use Mix.Task

  @shortdoc "Increments the version number and triggers configured hooks"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(args) do
    Relisa.line_break
    new_version = bump_version args
    Relisa.say "You're all set! Next steps:"
    Relisa.subsay "git add mix.exs && git commit -m \"#{new_version}\""
    Relisa.subsay "MIX_ENV=prod mix relisa.deploy"
    Relisa.line_break
  end

  defp bump_version(args) do
    config = Mix.Project.config()
    old_version = config[:version]
    new_version =
      old_version
      |> String.split(".")
      |> Enum.map(&parse_int/1)
      |> List.to_tuple
      |> bump_version(args)
      |> Tuple.to_list
      |> Enum.join(".")

    Relisa.say "Bumping OTP version for `#{config[:app]}`:"
    Relisa.subsay "Old version: #{old_version}"
    Relisa.subsay "New version: #{new_version}"
    config_file = File.read!("mix.exs")
    pattern = ~r/version: \"\d\.\d\.\d\"/
    config_file = Regex.replace(pattern, config_file, "version: \"#{new_version}\"")
    Relisa.subsay "Writing version to `mix.exs`"
    File.write! "mix.exs", config_file, [:write]
    new_version
  end

  defp parse_int(bin) do
    {int, _} = Integer.parse bin
    int
  end

  defp bump_version(tuple, args) do
    {major, minor, patch} = tuple
    case args do
      ["--major"|_] -> {major + 1, 0, 0}
      ["--minor"|_] -> {major, minor + 1, 0}
      _             -> {major, minor, patch + 1}
    end
  end
end
