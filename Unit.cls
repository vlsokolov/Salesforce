public class Unit {
    String hitPlace = null;
    String blockPlace = null;
    String SelectFighters = null;
    Integer roundNumber = 1;
    String firstName = null;
    String secondName = null;

    String out = '';
  
    //Creating new Units    
    Hero first = new Hero('Boromir', 700, 50, 40, 60, 40);
    Hero second = new Hero('Wu Tang', 1000, 100, 30, 40, 20);
        
    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Head','Head')); 
        options.add(new SelectOption('UpperBody','UpperBody')); 
        options.add(new SelectOption('LowerBody','LowerBody'));
        options.add(new SelectOption('Legs','Legs'));
        return options; 
    }
           
    public String getSelectFighters() {return SelectFighters;}
    public void setSelectFighters(String SelectFighters) {this.SelectFighters = SelectFighters;}
    
    public String getHitPlace() {return hitPlace;}                    
    public void setHitPlace(String hitPlace) { this.hitPlace = hitPlace; }
    
    public String getBlockPlace() {return BlockPlace;}                    
    public void setBlockPlace(String BlockPlace) { this.blockPlace = BlockPlace; }
    
    public Integer getRoundNumber()  {return roundNumber;}  
    public void setRoundNumber(Integer roundNumber) {this.roundNumber = roundNumber;}
    
    public String getFirstName() {return first.Name;}
    public String getSecondName() {return second.Name;}
    public Integer getFirstHP() {return first.HP;}
    public Integer getSecondHP() {return second.HP;}
    public String getOut() {return out;}
    
    
    public PageReference test() {
        
        Integer hitPlacePC = Math.round((Math.floor(Math.random() * 3.5)));
        Integer blockPlacePC = Math.round((Math.floor(Math.random() * 3.5)));
        SelectOption placePCHit = getItems().get(hitPlacePC);
        SelectOption placePCblock = getItems().get(blockPlacePC);
               
        if (hitPlace != placePCBlock.getValue() & blockPlace != placePCHit.getValue())
        {
        hero.fighting(first,second, true, true);
        out = 'Round ' + getRoundNumber() + ' - ' + first.getName() + ' hit ' + second.getName() + ' in the ' + hitPlace 
            + '\n' + second.getName() + ' hit ' + first.getName() + ' in the ' +  placePCHit.getValue() + '\n';
        } else {
            if (hitPlace == placePCBlock.getValue() & blockPlace != placePCHit.getValue())
            {
              hero.fighting(first,second, false, true);
              out = 'Round ' + getRoundNumber() + ' - the hit from ' + first.getName() + ' was blocked' +
            '\n' + second.getName() + ' hit ' + first.getName() + ' in the ' +  placePCHit.getValue() + '\n';}
            else
            {
                hero.fighting(first,second, true, false);
                out = 'Round ' + getRoundNumber() + ' - ' + first.getName() + ' hit ' + second.getName() + ' in the ' 
                + hitPlace + '\n' + ' the hit from ' + second.getName() + ' was blocked' + '\n';
            }
        }
     
        if (first.getHP() <= 0 & second.getHP() >= 0)
        {
            out = second.getName() + ' Win!'; 
            first.setHP(0);            
        } else {
            if (first.getHP() >= 0 & second.getHP() <= 0)
            {
                out = first.getName() + ' Win!';
				second.setHP(0);   
                
            } else {
                if (first.getHP() <= 0 & second.getHP() <= 0)
                {
                    out = 'Both heroes are death, nobody win)'; 
                    first.setHP(0);
                    second.setHP(0);                   
                }
            }
        }
        roundNumber++;
        return null;
    }
}