hostname_fqdn = "#{node.inmobi_vishal.rs_hostname}".downcase
template "/etc/hostname" do
    source "hostname.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
      :hostname_fqdn => hostname_fqdn
    )
  end
bash "set_hostname" do
    code << EOH
      start hostname
    EOH
  end
