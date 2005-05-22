#!/usr/bin/ruby -I../Lib -I../Modules

require 'Zsf/Core'
#require 'Encoders/IA32/JmpCallAdditive'
#require 'Nops/IA32/SingleByte'

register_log_source('core', Zsf::Logging::Sinks::Flatfile.new('/tmp/zsfcli.log'))

dlog('yo yo yo')

framework = Zsf::Framework.new

framework.modules.add_module_path('/home/mmiller/zsf/rubyhacks/prototype/Modules')


framework.encoders.each_module { |name|
	puts "got encoder #{name}"
}

encoder = framework.encoders.create('JmpCallAdditive')

#encoder = framework.encoders.instantiate('gen_ia32_jmp_call_additive')

puts "#{encoder.author_to_s}"
puts "#{encoder.arch_to_s}"

puts "#{encoder.arch?('ia32')} #{encoder.arch?('jabba')}"

begin
	encoded = encoder.encode("\xcc\x90\x90\x90ABCDEFGHIJKLMNOPQRSTUVWXYZ", "\x87")
rescue Zsf::Encoding::BadcharException => detail
	puts "bad char at #{detail.index} #{detail.buf.unpack('H*')[0]}"

	exit
end

puts encoded.unpack("H*")[0]

nop = Zsf::Nops::IA32::SingleByte.new

sled = nop.generate_sled(
	100,
	'Random'        => true)
#	'Badchars'      => "\x95")
#	'SaveRegisters' => [ 'eax' ])

puts sled.unpack("H*")[0]