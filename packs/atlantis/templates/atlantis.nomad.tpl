job [[ template "job_name" . ]] {
    datacenters = [ [[ range $idx, $dc := .atlantis.datacenters ]][[if $idx]],[[end]][[ $dc | quote ]][[ end ]] ]
    type        = "system"
    priotity    = 100

    vault {
        policies    = [[ .atlantis.vault_policies ]]
        change_mode = [[ .atlantis.vault_change_mode ]]
    }

    constraint {

    }

    group "atlantis" {

        network {
            port "ui" {
                static = [[ .atlantis.ui_port ]]
                to     = 4141
            }
        }

        task "atlantis" {

            driver = "docker"

            config {
                image              = "runatlantis/atlantis:v"
                dns_servers        = [""]
                dns_search_domains = [""]
                ports              = ["ui"]
            }

            resources {
                cpu    = [[ .atlantis.resources.cpu ]]
                memory = [[ .atlantis.resources.memory ]]
            }
        }

        service {
            
            tags = []
            name = "atlantis"
            port = "ui"
            
            check {
                type     = "http"
                port     = "ui"
                path     = "/healthz"
                interval = "10s"
                timeout  = "2s"
            }
        }

    }
}