defmodule PaymentApiWeb.AccountView do
  alias PaymentApi.Models.Account
  alias PaymentApi.UseCases.Account.Dto.TransactionResponse, as: TransactionResponse

  def render("patch.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance patched successfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
        transaction: %TransactionResponse{to_account: to_account, from_account: from_account}
      }) do
    %{
      message: "Transaction processed successfully",
      account: %{
        from_account: %{
          id: from_account.id,
          balance: from_account.balance
        },
        to_account: %{
          id: to_account.id,
          balance: to_account.balance
        }
      }
    }
  end
end
