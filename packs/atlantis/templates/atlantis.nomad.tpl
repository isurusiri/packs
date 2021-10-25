job [[ template "job_name" . ]] {
    datacenters = [""]
    type        = "system"
    priotity    = 100

    vault {
        policies    = [""]
        change_mode = "restart"
    }

    constraint {

    }

    group "atlantis" {

        network {
            port "ui" {
                static = 80
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
                cpu    = 1024
                memory = 1024
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