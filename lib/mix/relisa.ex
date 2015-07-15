defmodule Mix.Relisa do
  @doc """
  Copies files from source dir to target dir
  according to the given map.
  Files are evaluated against EEx according to
  the given binding.
  """
  def copy_from(source_dir, target_dir, binding, mapping) when is_list(mapping) do
    for {format, source_file_path, target_file_path} <- mapping do
      source = Path.join(source_dir, source_file_path)
      target = Path.join(target_dir, target_file_path)

      contents =
        case format do
          :text -> File.read!(source)
          :eex  -> EEx.eval_file(source, binding)
        end

      Mix.Generator.create_file(target, contents)
    end
  end
end
