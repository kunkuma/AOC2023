def process_games():
    total_id, power_set_sum = 0, 0
    with open('./Input/day2Input.txt', 'r') as f:
        for game in f.readlines():
            game_id, rounds = map(str.strip, game.split(':'))
            game_id = int(game_id.split()[1])
            rounds = rounds.split(';')
            game_possible = True
            blue_values = []
            green_values = []
            red_values = []
            for round in rounds:
                blue = sum(int(outcome.split()[0]) for outcome in round.split(',') if 'blue' in outcome)
                green = sum(int(outcome.split()[0]) for outcome in round.split(',') if 'green' in outcome)
                red = sum(int(outcome.split()[0]) for outcome in round.split(',') if 'red' in outcome)
                blue_values.append(blue)
                green_values.append(green)
                red_values.append(red)
                if blue > 14 or green > 13 or red > 12:
                    game_possible = False
            power_set_sum += max(blue_values) * max(green_values) * max(red_values)
            if game_possible:
                total_id += game_id
    return total_id, power_set_sum

print(process_games())
