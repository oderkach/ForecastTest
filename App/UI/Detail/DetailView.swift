//
//  DetailView.swift
//  App
//
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: DetailViewModel

    var body: some View {
        DetailContainerView(item: viewModel.item)
    }
}

private struct DetailContainerView: View {
    let item: ForecastItem

    var body: some View {
        VStack(spacing: 20) {
            headerView

            VStack(spacing: 8) {
                buildRowView(
                    title: "Temperature - \(item.highFormatted) \(item.lowFormatted)"
                )

                buildRowView(
                    title: "Sunrise \(item.sunriseFormatted) - Sunset \(item.sunsetFormatted)"
                )

                item.chanceRainFormatted.map {
                    buildRowView(
                        title: "Chance of rain - \($0)"
                    )
                }
            }

            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.all, 20)
        .background(Color(.background))
    }

    private var headerView: some View {
        VStack(spacing: 12) {
            item.conditionImage.map {
                Image($0)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
            }

            Text("Day \(item.day) - \(item.description)")
                .font(.title3)
                .foregroundColor(.white)
        }
    }

    private func buildRowView(title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundColor(.white)
    }
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ForecastItem(
            day: "1",
            description: "Sunny",
            sunrise: 27420,
            sunset: 63600,
            high: 15,
            low: 6,
            chanceRain: 0.1,
            condition: .sunny
        )
        DetailContainerView(item: item)
    }
}
#endif
