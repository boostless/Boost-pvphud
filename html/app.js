function main(){
    return {
        show: false,
        kills: 0,
        deaths: 0,
        money: 0,
        level: 1,
        kd: 0,
        xp: 0,
        nextXp: 0,
        levelW: 0,
        listen(){
            window.addEventListener('message', (event) => {
                let data = event.data
                switch(data.type){
                    case 'ui':
                        this.show = data.show
                        break;
                    case 'update':
                        this.level = data.data.level
                        this.xp = data.data.xp
                        this.nextXp = data.data.nextXp
                        this.kills = data.data.kills
                        this.deaths = data.data.deaths
                        this.kd = data.data.kd
                        this.money = data.data.money
                        this.levelW = (data.data.xp * 100) / data.data.nextXp
                        break;
                }
            })
        }
    }
}