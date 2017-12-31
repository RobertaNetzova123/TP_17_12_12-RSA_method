require 'prime'
class RSA
   def initialize n, e, d
    	@n = n.to_i
    	@e = e.to_i
      	@d = d.to_i
   end
   
   def n
     return @n
   end
   
   def e
	return @e
   end
   
   def d
     return @d
   end
   
   def new_key
     	array = Array.new
	p = rand(1000)
	q = rand(1000)


		while !Prime.prime?(q)
			q = rand(1000)
		end
while !Prime.prime?(p)
			p = rand(1000)
		end		

	n = p * q
	phi = (p -1) * (q -1)

	e = rand(phi)

	while e.gcd(phi) != 1
		e = rand(phi)
	end

	d = rand(phi)
	while (d * e)%phi != 1
		d = rand (phi)
	end 
	
	array[0] = n
	array[1] = e
	array[2] = d
	return array	
   end
   
   def encrypt message
      return (message.chars.map {|c| c.ord ** @e % @n}).join(",")
   end
   
   def decrypt message
     	return (message.split(",").map {|c| (c.to_i ** @d % @n).chr}).join("")
   end 
end


r = RSA.new(2231, 181, 1021)
secret = r.encrypt("HEllo")
#puts "Decrypt"
msg = r.decrypt(secret)

puts msg

