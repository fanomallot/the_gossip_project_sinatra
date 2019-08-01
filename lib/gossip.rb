
class  Gossip
	attr_accessor :author ,:content 
	def initialize(author,content)
		@author = author
	 	@content = content
	end
	def save
  		CSV.open("./db/gossip.csv", "ab") do |csv|
    		csv << [@author, @content]
    	end
  	end
  	def self.all
  		all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
 	 	end
  		return all_gossips
	end	
	def find(id)
		id = id.to_i
		tab = CSV.read("./db/gossip.csv")
		return tab[id-1]
	end
	def self.update(author,content,id)
		id = id.to_i
		tab = CSV.read("./db/gossip.csv")
		tab[id-1] = [author,content]
		CSV.open("./db/gossip.csv", "w") do |csv|
			for i in 0..tab.length-1 do
    			csv << tab[i]
    		end
    	end
    end
end
   		


