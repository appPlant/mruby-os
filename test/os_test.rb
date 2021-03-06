# MIT License
#
# Copyright (c) Sebastian Katzer 2017
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

assert 'sysname' do
  assert_false OS.sysname.nil?
end

assert 'machine' do
  assert_false OS.machine.nil?
end

assert 'windows?' do
  assert_equal ENV['OS'] == 'Windows_NT', OS.windows?
end

assert '*nix?' do
  assert_equal ENV['OS'] != 'Windows_NT', OS.linux? || OS.osx?
end

assert 'posix?' do
  assert_equal OS.linux? || OS.osx?, OS.posix?
end

assert 'bits' do
  assert_include [32, 64], OS.bits
end

assert 'bits(machine)' do
  assert_include [32, 64], OS.bits(:machine)
end

assert 'bits(binary)' do
  assert_include [32, 64], OS.bits('binary')
end

assert 'bits(unknown)' do
  assert_nil OS.bits('unknown')
end
