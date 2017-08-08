Puppet::Type.newtype(:netapp_net_port) do
  @doc = 'Manage Netapp network port. [Family: cluster]'

  apply_to_device

  newparam(:node_port_name) do
    desc 'The node and port name concatenated with @'
    isnamevar
    validate do |value|
      raise ArgumentError, "#{value} is a invalid node_port name" unless
        value =~ /^[a-zA-Z\-_.0-9]+(?:@[0-9a-zA-Z]+)$/
    end
  end

  newproperty(:flowcontrol_admin) do
    desc 'The administrative flow control setting of the port'
    newvalues(:none, :receive, :send, :full)
  end
end