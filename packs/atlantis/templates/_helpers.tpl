// allow nomad-pack to set the job name

[[- define "job_name" -]]
[[- if eq .atlantis.job_name "" -]]
[[- .nomad_pack.pack.name | quote -]]
[[- else -]]
[[- .atlantis.job_name | quote -]]
[[- end -]]
[[- end -]]
