class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
    attr_accessor :value

    def initialise
      @value = nil
    end

    def set_case(new_value)
      @value = new_value
    end
end

class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :case

  def initialize
    @case = [
      [ BoardCase.new, BoardCase.new, BoardCase.new ], 
      [ BoardCase.new, BoardCase.new, BoardCase.new ], 
      [ BoardCase.new, BoardCase.new, BoardCase.new ]  
    ]
  end

  def affichage
    print "\t",  "*"*13, "\n"
    3.times do |x|
      print "\t| "
      3.times do |y|
        if @case[x][y].value==nil
          print ". | "
        else
          print "#{@case[x][y].value} | "
        end
      end
      puts
      print "\t",  "*"*13, "\n"
    end
  end

  def check
    3.times do |ligne|
          verification = 0
          2.times do |col|
              if @case[ligne][col].value == nil
            
              elsif !(@case[ligne][col].value == @case[ligne][col+1].value)
                 
              else
                  verification += 1
              end
              if verification == 2
                  return true 
              end
          end
      end

    puts
    3.times do |col|
          verification = 0
          2.times do |ligne|
              if @case[ligne][col].value == nil
              elsif !(@case[ligne][col].value == @case[ligne+1][col].value)

              else
                  verification += 1
              end
              if  verification == 2
               
                  return true
              end
          end
      end

   
    if @case[1][1].value !=nil
    
      if @case[0][0].value == @case[1][1].value && @case[1][1].value == @case[2][2].value
        return true
     
      elsif @case[0][2].value == @case[1][1].value && @case[1][1].value == @case[2][0].value
        return true
      end
    end
      
      return false
  end

  def tab
    return @case
  end

end

class Players
  attr_accessor :nom ,:forme

  def initialize(forme)
    @nom = nom
    @forme = forme
  end

  def Info
    puts "Joueur : #{@nom}"
    puts "Joue avec : #{@forme}"
  end

  def Forme
    return @forme
  end

  def Name
    return @nom.capitalize
  end

end

class Application
  attr_accessor :JOUEUR1, :JOUEUR2, :plateau

  def initialize 
   
    print "Entrez le nom du joueur 1:"
    @JOUEUR1 = Players.new(gets.chomp, "X")
    @JOUREUR1.Info
    puts
    print "Entrez le nom du joueur 2 :"
    @JOUEUR2 = Players.new(gets.chomp, "O")
    @JOUEUR2.Info
    @plateau = Board.new()
  end

  def Position
    ligne = 0
    colonne = 0
    
    
    loop do 
      
      while ligne > 3 || ligne < 1
        ligne = 0
        colonne = 0   
        print "Choisir ligne entre 1 et 3:"
        ligne = gets.chomp.to_i
      end 
      while colonne > 3 || colonne < 1
        print "Choisir colonne entre 1 et 3:"
        colonne = gets.chomp.to_i
      end
     
      ligne -= 1
      colonne -= 1

      break if @plateau.tab[ligne][colonne].value==nil
    end

    return @plateau.tab[ligne][colonne]
  end


  def end_game
    fin = false
    3.times do |ligne|
      3.times do |colonne|
        if @plateau.tab[ligne][colonne].value == nil
          return fin = false
        end
      end
    end
    return true       
  end

  def main
    5.times do |tour|
      puts
      @plateau.affichage
      puts
      puts
      print "\t" , "-"*12, "\n"
      puts "\t|  JOUEUR 1 : #{@JOUEUR1.NAME}"
      print "\t" , "-"*12, "\n"
      a = nil
      loop do
        a = Position
        break unless a==nil
      end
      a.case(@JOUEUR1.Forme)

      @plateau.affichage
      if @plateau.check == true
        puts "-"*23
        puts "| VICTOIRE du JOUEUR1 |"
        puts "|    FELICITATIONS    |"
        puts "-"*23
        return true
      end
      puts

   
      if end_game == true
        puts "-"*19
        puts "| FIN DE LA PARTIE |"
        puts "|--  VELOMA TPK  --|"
        puts "-"*19
        return false
      end
    
      print "\t" , "-"*12, "\n"
      puts "\t|  JOUEUR 2 : #{@JOUEUR2.NAME}"
      print "\t" , "-"*12, "\n"
      a=position
      a.case(@JOUEUR2.Forme)

   
      @plateau.affichage
      if @plateau.check == true
        puts "-"*23
        puts "| VICTOIRE du JOUEUR2 |"
        puts "|\tFELICITATIONS      |"
        puts "-"*23
        return true
      end

    end
  end
end

Application.new.perform

