# This file is part of kitchen-qemu-images.
# Copyright 2016 Emil Renner Berthing <esmil@esmil.dk>
#
# kitchen-qemu-images is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# kitchen-qemu-images is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with kitchen-qemu-images.  If not, see <http://www.gnu.org/licenses/>.

root = node['image']['mountpoint']

for i in 2..6 do
  file "#{root}/etc/init/tty#{i}.override" do
    owner 'root'
    group 'root'
    mode 0644
    content "manual\n"
    action :create
  end
end

cookbook_file "#{root}/etc/init/ttyS0.conf" do
  owner 'root'
  group 'root'
  mode 0644
  action :create
end

# vim: set ts=2 sw=2 et:
