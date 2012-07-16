maintainer       "Example Com"
maintainer_email "ops@example.com"
license          "Apache 2.0"
description      "Installs/Configures inmobi_vishal"

version          "0.1"

recipe "inmobi_vishal::base_os_config", "Configures basic OS files"
attribute "inmobi_vishal/rs_hostname",
 :display_name => "Nickname - Vihsal hosts",
 :description => "The First recipes config for vishal",
 :required => "required",
 :recipes => [ "inmobi_vishal::base_os_config" ]
