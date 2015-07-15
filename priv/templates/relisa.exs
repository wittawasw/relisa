use Mix.Config

config :relisa,
  targets: [
    # Targets are specified with an {address, ssh_key_path} tuple
    # {"ubuntu@54.68.138.247", "/vagrant/deploy.pem"}
  ],
  hooks: [
    # Hooks are Mix tasks that will be executed at certain life-cycle moments
    # in Relisa
    # pre: ["phoenix.digest"]
  ]
